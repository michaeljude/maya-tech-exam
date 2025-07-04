import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Scheduling App'**
  String get appTitle;

  /// Welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Sign up button text
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Label for the shift title input field
  ///
  /// In en, this message translates to:
  /// **'Shift Title'**
  String get shiftTitle;

  /// Placeholder text for the shift title input field
  ///
  /// In en, this message translates to:
  /// **'e.g. Morning Shift'**
  String get shiftTitlePlaceholder;

  /// Start time label with time parameter
  ///
  /// In en, this message translates to:
  /// **'Start: {time}'**
  String startTime(String time);

  /// End time label with time parameter
  ///
  /// In en, this message translates to:
  /// **'End: {time}'**
  String endTime(String time);

  /// Text for the save shift button
  ///
  /// In en, this message translates to:
  /// **'Save Shift'**
  String get saveShift;

  /// Text for the close button
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Navigation item for dashboard
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// Navigation item for shifts
  ///
  /// In en, this message translates to:
  /// **'Shifts'**
  String get shifts;

  /// Navigation item for employees
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// Navigation item for reports
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// Navigation item for settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Navigation item for logout
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Tooltip for expanding the navigation
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get expand;

  /// Tooltip for collapsing the navigation
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// Company name displayed in navigation
  ///
  /// In en, this message translates to:
  /// **'Oasjs'**
  String get companyName;

  /// Text shown during loading states
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Error message
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Title shown on the authentication form when signing in.
  ///
  /// In en, this message translates to:
  /// **'Hi there, please log in.'**
  String get authSignInTitle;

  /// Title shown on the authentication form when signing up.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get authSignUpTitle;

  /// Button text for signing in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authSignInButton;

  /// Button text for signing up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get authSignUpButton;

  /// Snackbar message shown after successful sign up.
  ///
  /// In en, this message translates to:
  /// **'Sign-up successful!'**
  String get authSignUpSuccess;

  /// Text for the button to switch to sign up form.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign Up'**
  String get authToggleToSignUp;

  /// Text for the button to switch to sign in form.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign In'**
  String get authToggleToSignIn;

  /// Placeholder text for the email input field in auth form
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get authEmailPlaceholder;

  /// Placeholder text for the password input field in auth form
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get authPasswordPlaceholder;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
