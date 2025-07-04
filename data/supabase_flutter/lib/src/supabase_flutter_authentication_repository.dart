import 'dart:async';
import 'dart:convert' show base64Url, json, utf8;

import 'package:domain/domain.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFlutterAuthenticationRepository
    implements AuthenticationRepository {
  SupabaseFlutterAuthenticationRepository({
    required this.anonKey,
    required this.url,
  });

  final String url;
  final String anonKey;

  GoTrueClient? _authClient;
  Logger? supabaseLogger;
  var _isInitialized = false;

  StreamSubscription<AuthState>? _authStateSubscription;

  final _authStateSubject =
      BehaviorSubject<Result<AuthenticationEntity?>>.seeded(
        Success(null, onRetry: () async => Future.value()),
      );

  @override
  Future<void> initialize() async {
    if (_isInitialized) {
      return;
    }

    final supabase = await Supabase.initialize(
      url: url,
      anonKey: anonKey,
      realtimeClientOptions: const RealtimeClientOptions(eventsPerSecond: 2),
      storageOptions: const StorageClientOptions(retryAttempts: 3),
    );
    supabaseLogger = Logger('supabase');
    _authClient = supabase.client.auth;
    _isInitialized = true;

    // Check for existing session immediately after initialization.
    _checkExistingSession();

    // Then start listening to auth state changes.
    connect();
  }

  void _checkExistingSession() {
    if (!_isInitialized || _authClient == null) {
      return;
    }

    final currentSession = _authClient?.currentSession;
    if (currentSession != null) {
      supabaseLogger?.log(
        Level.INFO,
        'Found existing session on initialization',
      );
      _handleSession(currentSession);
    } else {
      supabaseLogger?.log(
        Level.INFO,
        'No existing session found on initialization',
      );
    }
  }

  @override
  void connect() {
    if (!_isInitialized || _authClient == null) {
      return;
    }

    _authStateSubscription = _authClient?.onAuthStateChange.listen((
      final data,
    ) {
      if (data.event == AuthChangeEvent.initialSession ||
          data.event == AuthChangeEvent.tokenRefreshed ||
          data.event == AuthChangeEvent.signedIn) {
        final session = data.session;
        if (session != null) {
          _handleSession(session);
        } else {
          supabaseLogger?.log(Level.INFO, 'No initial session found');
          // No session found in storage - user is signed out.
          _authStateSubject.add(
            Success(
              AuthenticationEntity.signedOut(),
              onRetry: () async => Future.value(),
            ),
          );
        }

        return;
      }

      // Handle other auth state changes.
      if (data.session == null) {
        supabaseLogger?.log(Level.INFO, 'Session became null: ${data.event}');
        _authStateSubject.add(
          Success(
            AuthenticationEntity.signedOut(),
            onRetry: () async => Future.value(),
          ),
        );

        return;
      }

      supabaseLogger?.log(Level.INFO, 'Session updated: ${data.event}');
      final session = data.session;
      if (session != null) {
        _handleSession(session);
      }
    });
  }

  void _handleSession(final Session session) {
    final accessToken = session.accessToken;

    try {
      final claims = _decodeJwt(accessToken);

      final roleList = claims['user_roles'];
      final permissionList = claims['user_permissions'];

      if (roleList is List<dynamic> && permissionList is List<dynamic>) {
        final roles = roleList.map((final role) => role.toString()).toList();
        final permissions = permissionList
            .map((final permission) => permission.toString())
            .toList();

        supabaseLogger?.log(Level.INFO, 'Valid session with roles: $roles');
        _authStateSubject.add(
          Success(
            AuthenticationEntity.signedIn(
              permissions: permissions,
              roles: roles,
              session: SessionEntity(
                accessToken: accessToken,
                expiresIn: session.expiresIn,
                refreshToken: session.refreshToken,
              ),
            ),
            onRetry: () async => Future.value(),
          ),
        );
      } else {
        supabaseLogger?.log(
          Level.INFO,
          'Session exists but no roles/permissions found',
        );
        // Session exists but no roles/permissions - treat as signed out.
        _authStateSubject.add(
          Success(
            AuthenticationEntity.signedOut(),
            onRetry: () async => Future.value(),
          ),
        );
      }
    } catch (error, stackTrace) {
      supabaseLogger?.log(
        Level.SEVERE,
        'Error decoding session token: $error',
        error,
        stackTrace,
      );
      _authStateSubject.add(
        UnauthorizedFailure(
          message: 'Invalid session token',
          onRetry: () async => Future.value(),
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  @override
  Future<void> signUp({
    required final String email,
    required final String password,
  }) async {
    try {
      await _authClient?.signUp(email: email, password: password);
    } on AuthException catch (_) {}
  }

  @override
  Future<void> signIn({
    required final String email,
    required final String password,
  }) async {
    try {
      await _authClient?.signInWithPassword(email: email, password: password);
    } on AuthException catch (error) {
      supabaseLogger?.log(Level.SEVERE, 'Error signing in: $error');
    }
  }

  @override
  Future<void> signOut() async {
    await _authClient?.signOut();
  }

  Map<String, dynamic> _decodeJwt(final String accessToken) {
    final parts = accessToken.split('.');
    if (parts.length != 3) {
      return {};
    }

    final value = parts.elementAtOrNull(1);
    if (value == null) {
      return {};
    }

    final payload = utf8.decode(base64Url.decode(base64Url.normalize(value)));

    final jsonValue = json.decode(payload);

    return jsonValue is Map<String, dynamic> ? jsonValue : {};
  }

  @override
  Stream<Result<AuthenticationEntity?>> get authState =>
      _authStateSubject.stream;

  @override
  Future<bool> hasAccessToken() async =>
      _authClient?.currentSession?.accessToken != null;

  @override
  Future<String?> accessToken() async =>
      _authClient?.currentSession?.accessToken;

  @override
  Future<void> removePersistedSession() async => {};

  @override
  Future<void> persistSession(final String persistSessionString) async =>
      _authClient?.currentSession;

  @override
  Future<void> dispose() async {
    await _authStateSubscription?.cancel();
    await _authStateSubject.close();
    _authClient?.dispose();
  }
}
