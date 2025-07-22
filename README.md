# flutter-shared-components

A collection of reusable Flutter widgets and screens designed to be easily integrated into your projects. This package currently includes a customizable splash screen and a styled action button.

## Features

*   **`HomeScreen`**: A splash screen with a logo and company name animation. It automatically navigates to a specified screen after the animation completes.
*   **`StyledActionButton`**: A customizable button with a pressed-down effect and shadow.
*   **`BadgedActionButton`**: A wrapper around `StyledActionButton` that adds a small badge to the corner, useful for notifications.

## Getting started

To use this package, add `flutter_shared_components` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  flutter_shared_components:
    git:
        url: https://github.com/SoloScripted/flutter-shared-components.git
```

Then, run `flutter pub get`.

## Usage

Here's how to use the `HomeScreen` as your initial route:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_shared_components/flutter_shared_components.dart';
import 'package/your_app/main_screen.dart'; // Your app's main screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: const HomeScreen(
        nextScreen: MainScreen(), // Provide the screen to navigate to
      ),
    );
  }
}
```

## Development

This project uses FVM (Flutter Version Management) to ensure all contributors use the same Flutter SDK version.

### Setup

To get started with development, run the setup command. This will check if you have FVM installed, use it to install the correct project-specific Flutter SDK, and fetch all dependencies.

```sh
make setup
```

The provided `Makefile.mk` handles all other common tasks like `make format` and `make lint`. These commands automatically use the project's FVM-managed Flutter SDK.
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
