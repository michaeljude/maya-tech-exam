// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Scheduling App';

  @override
  String get welcome => 'Welcome';

  @override
  String get login => 'Login';

  @override
  String get signup => 'Sign Up';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get shiftTitle => 'Shift Title';

  @override
  String get shiftTitlePlaceholder => 'e.g. Morning Shift';

  @override
  String startTime(String time) {
    return 'Start: $time';
  }

  @override
  String endTime(String time) {
    return 'End: $time';
  }

  @override
  String get saveShift => 'Save Shift';

  @override
  String get close => 'Close';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get shifts => 'Shifts';

  @override
  String get employees => 'Employees';

  @override
  String get reports => 'Reports';

  @override
  String get settings => 'Settings';

  @override
  String get logout => 'Logout';

  @override
  String get expand => 'Expand';

  @override
  String get collapse => 'Collapse';

  @override
  String get companyName => 'Oasjs';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get authSignInTitle => 'Hi there, please log in.';

  @override
  String get authSignUpTitle => 'Create an account';

  @override
  String get authSignInButton => 'Sign In';

  @override
  String get authSignUpButton => 'Sign Up';

  @override
  String get authSignUpSuccess => 'Sign-up successful!';

  @override
  String get authToggleToSignUp => 'Don\'t have an account? Sign Up';

  @override
  String get authToggleToSignIn => 'Already have an account? Sign In';

  @override
  String get authEmailPlaceholder => 'Enter your email';

  @override
  String get authPasswordPlaceholder => 'Enter your password';
}
