# VAN - Flutter Application

A Flutter application built following official documentation best practices and modern development standards.

## 📱 Features

- **Modern UI**: Material 3 design with light/dark theme support
- **Responsive Layout**: Adaptive design for different screen sizes
- **Clean Architecture**: Well-organized project structure following Flutter best practices
- **Interactive Counter**: Enhanced counter widget with animations and multiple controls
- **Navigation**: Bottom navigation and drawer navigation
- **Utilities**: Helper functions for common operations
- **Testing**: Unit tests included

## 🏗️ Project Structure

```
lib/
├── constants/          # App-wide constants
│   └── app_constants.dart
├── models/            # Data models
│   └── user_model.dart
├── screens/           # Screen widgets
│   └── home_screen.dart
├── services/          # API and business logic
│   └── api_service.dart
├── utils/             # Utility functions
│   └── app_utils.dart
├── widgets/           # Reusable widgets
│   ├── app_drawer.dart
│   └── counter_widget.dart
└── main.dart          # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.35.7 or later)
- Dart SDK (3.9.2 or later)
- IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd van
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Running Tests

```bash
flutter test
```

### Code Analysis

```bash
flutter analyze
```

## 🎨 Design Principles

This project follows Flutter's official documentation recommendations:

- **Material 3 Design**: Modern Material Design 3 components and theming
- **Responsive Design**: Adaptive layouts for different screen sizes
- **Clean Code**: Well-structured, readable, and maintainable code
- **State Management**: Proper state management using StatefulWidget
- **Error Handling**: Comprehensive error handling and user feedback
- **Performance**: Optimized widgets and efficient rendering

## 📚 Key Components

### Constants
- Centralized app configuration
- Color schemes and spacing definitions
- Animation durations and API settings

### Models
- Data structures with JSON serialization
- Immutable objects with copyWith methods
- Proper equality and hashCode implementations

### Services
- API service layer with error handling
- Singleton pattern for service instances
- Mock data for development and testing

### Utilities
- Common helper functions
- Validation utilities
- UI feedback helpers (snackbars, dialogs)

### Widgets
- Reusable UI components
- Animated interactions
- Consistent styling and behavior

## 🔧 Development Guidelines

1. **Follow Flutter Lints**: The project uses `flutter_lints` for code quality
2. **Use Constants**: Define colors, spacing, and strings in constants
3. **Widget Composition**: Break down complex UIs into smaller widgets
4. **State Management**: Use appropriate state management for your needs
5. **Testing**: Write tests for critical functionality
6. **Documentation**: Document complex logic and public APIs

## 📖 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Material 3 Design](https://m3.material.io/)
- [Flutter Best Practices](https://docs.flutter.dev/perf/best-practices)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)

## 🤝 Contributing

1. Follow the existing code style and structure
2. Add tests for new features
3. Update documentation as needed
4. Run `flutter analyze` before submitting changes

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
