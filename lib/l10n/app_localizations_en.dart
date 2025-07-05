// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Maya';

  @override
  String get welcomeToMaya => 'Welcome To Maya';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get amount => 'Amount';

  @override
  String get recipientPhone => 'Recipient Phone';

  @override
  String get walletBalance => 'Wallet Balance';

  @override
  String get sendMoney => 'Send Money';

  @override
  String get viewTransactions => 'View Transactions';

  @override
  String get pleaseEnterYourEmail => 'Please enter your email';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email';

  @override
  String get pleaseEnterYourPassword => 'Please enter your password';

  @override
  String get passwordMustBeAtLeast6Characters => 'Password must be at least 6 characters';

  @override
  String get moneySentSuccessfully => 'Money sent successfully';

  @override
  String get pleaseEnterRecipientPhone => 'Please enter recipient phone';

  @override
  String get pleaseEnterValidPhoneNumber => 'Please enter a valid phone number';

  @override
  String get pleaseEnterAmount => 'Please enter amount';

  @override
  String get moneySent => 'Money Sent';

  @override
  String get moneyReceived => 'Money Received';

  @override
  String recipient(Object recipient) {
    return 'Recipient: $recipient';
  }

  @override
  String get noTransactionsFound => 'No transactions found';
}
