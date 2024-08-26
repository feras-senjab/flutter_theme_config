# Flutter Theme Config

[![Flutter](https://img.shields.io/badge/Flutter-3.24.1-blue.svg)](https://flutter.dev)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

A robust theming solution for Flutter applications that supports both light and dark themes. This project implements a modular approach to theme management using the BLoC pattern, providing flexibility and scalability for developers.

## Features

- **Theme Management:** Easily switch between light and dark themes.
- **Dynamic System Theme Detection:** Automatically adapts to the system theme preference.
- **State Management:** Utilizes `ThemeCubit` for managing theme state.
- **Persistence:** Saves user theme preferences using `SharedPreferences`.
- **Modular Structure:** Add and customize themes with minimal changes.

## Getting Started

### Prerequisites

- Flutter SDK 3.24.1 or later
- Dart 3.5.1 or later
- Xcode 15.0 (for iOS development)
- Android Studio (for Android development)

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/feras-senjab/flutter_theme_config.git
   ```

2. **Navigate to the project directory:**
    ```bash
    cd flutter_theme_config
    ```

3. **Install Dependencies:**
    ```bash
    flutter pub get
    ```

4. **Run the App:**
    ```bash
    flutter run
    ```

## Project Structure
The project follows a clean architecture with a well-defined structure:

```text
lib/
├── cubit/
│   ├── theme_cubit.dart
├── styles/
│   ├── app_theme.dart
│   ├── theme_manager.dart
│   ├── base/
│   │   ├── base_theme.dart
│   │   ├── properties/
│   ├── themes/
│   │   ├── light_theme.dart
│   │   ├── dark_theme.dart
│   ├── colors.dart
├── main.dart
```

### Key Directories

- **cubit/:** Contains `ThemeCubit`, which handles the application's theme state.
- **styles/:** Holds all the theme-related files, including `app_theme.dart` for theme enumeration, `theme_manager.dart` for managing theme logic, and specific theme files.

### Theme Management

The project allows you to easily manage and extend themes:
- **Light and Dark Themes:** Defined in `light_theme.dart` and `dark_theme.dart`.
- **ThemeCubit:** Controls the current theme and responds to changes in the system's theme settings.
- **Theme Persistence:** User preferences are stored using `SharedPreferences`.

## Usage

To change the theme, use the `ThemeCubit` within your application. You can easily switch themes or rely on system settings to handle it dynamically.

```dart
context.read<ThemeCubit>().setTheme(AppTheme.light);
```

To support dynamic theme switching based on the system:

```dart
context.read<ThemeCubit>().setDefaultTheme();
```

## Contributing
Contributions are welcome! If you have suggestions for improving the project or want to report a bug, feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
    
- Flutter team for the awesome framework.
- The open-source community for various inspirations and packages.

