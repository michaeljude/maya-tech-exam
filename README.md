# Maya Tech Exam - Flutter Project

A Flutter application built with a modular architecture using clean architecture principles.

## Prerequisites

### Flutter Version
This project requires **Flutter version 3.21.1**.

#### Using FVM (Flutter Version Management)
If you're using FVM, create an alias to use FVM's Flutter version:
```bash
# Create alias for fvm flutter -> flutter
alias flutter='fvm flutter'
```

#### Manual Flutter Installation
If you're not using FVM, ensure you have Flutter 3.21.1 installed:
```bash
# Check your current Flutter version
flutter --version

# If you need to install or switch to 3.21.1, follow Flutter's official installation guide
# https://docs.flutter.dev/get-started/install
```

## Project Setup

### 1. Clone the Repository
```bash
git clone https://github.com/michaeljude/maya-tech-exam.git or git@github.com:michaeljude/maya-tech-exam.git
cd maya-tech-exam
```

### 2. Initial Setup
Run the following command to set up all dependencies and generate necessary files:
```bash
make setup_all
```

This command will:
- Install all Flutter dependencies for the main project
- Generate code using build_runner for all modules
- Set up dependencies for all sub-modules (data, domain, design_system)
- Generate models and serialization code

### 3. Alternative Setup Commands

If you need to run setup steps individually:

```bash
# Install dependencies only
make setup_dependencies

# Update data modules
make update_data

# Generate models for specific modules
make models              # Main project models
make models_domain       # Domain models
make models_js           # JSON serializable models
make models_maya         # Maya API models
```

## Running Tests

To run all tests in the project:
```bash
make run_tests
```

This will execute:
- Home view model tests
- Send money view model tests
- Transactions view model tests
- Domain service tests (wallet and authentication)
- Maya repository tests

## Project Structure

This project follows a modular architecture with the following structure:

```
maya-tech-exam/
├── lib/                    # Main application code
│   ├── app/               # App configuration and utilities
│   ├── features/          # Feature-based modules
│   ├── l10n/              # Localization
│   └── router/            # Navigation
├── data/                  # Data layer modules
│   ├── flutter_secure_storage/  # Secure storage implementation
│   ├── json_serializable/       # JSON serialization
│   └── maya/                    # Maya API integration
├── domain/                # Domain layer (business logic)
├── design_system/         # UI components and theme
└── test/                  # Test files
```

## Development

### Code Generation
The project uses several code generation tools:
- **build_runner**: For generating models, serialization, and routing code
- **freezed**: For immutable data classes
- **auto_route**: For navigation

### Running the App
```bash
# Run in debug mode
flutter run

# Run in release mode
flutter run --release
```

### Building the App
```bash
# Build for Android
flutter build apk

# Build for iOS
flutter build ios

# Build for web
flutter build web
```

## Test Accounts

The application uses a fake API for testing purposes. The following accounts are available for testing (no passwords required):
https://jsonplaceholder.typicode.com/users

- `Sincere@april.biz`
- `Shanna@melissa.tv`
- `Nathan@yesenia.net`
- `Julianne.OConner@kory.org`
- `Lucio_Hettinger@annie.ca`
- `Karley_Dach@jasper.info`
- `Telly.Hoeger@billy.biz`
- `Sherwood@rosamond.me`

> **Note**: These are test accounts from the fake API service and do not require passwords for authentication.

## Dependencies

The project uses several key dependencies:
- **flutter_bloc**: State management
- **auto_route**: Navigation
- **dio**: HTTP client
- **freezed**: Immutable data classes
- **provider**: Dependency injection

## Troubleshooting

### Common Issues

1. **Flutter version mismatch**: Ensure you're using Flutter 3.21.1
2. **Build runner conflicts**: Run `make setup_all` to regenerate all files
3. **Dependency issues**: Try running `flutter clean` followed by `make setup_all`

### Getting Help
If you encounter any issues during setup, please check:
1. Flutter version compatibility
2. All dependencies are properly installed
3. Build runner generated files are up to date

## Contributing

1. Ensure you're using the correct Flutter version
2. Run tests before submitting changes: `make run_tests`
3. Follow the existing code structure and patterns
4. Update tests for any new functionality


## Contact Support

If you continue to experience issues after following the troubleshooting steps, please contact:
michaeljude.jmdr@gmail.com
