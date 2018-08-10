# Flutter Integration

## Summary
Flutter Integration was originally a research spike into integrating [Flutter](https://flutter.io/) components (screens, business logic, API calls, etc.) into natively written application. Since then it has evolved to also include the investigation of Flutter for Production as well as Fast Prototyping, with topics such as security and native communication.

## What is Flutter?
Flutter is a new hybrid development SDK, from Google, who has been heavily invested in it and its programming language, Dart. Unlike competing hybrid development SDKs, Flutter claims to build truly native UI experiences with matching performance and ease-of-development.

## Directory Structure
This is the root repository that contains each of the different integration attempts and base projects.
The main `Android` and `iOS` repositories will be a continuation of the `integration-testing` branch and will have different language feature additions like communication.

`base` - Contains one directory each for the base native iOS/native Android/Flutter projects that will be used in each integration method

`Android` - Project for native Android -> Flutter integration

`iOS` - Project for native iOS -> Flutter integration

## Running the projects
These projects require [Flutter](https://flutter.io/get-started/install/) to be installed.

The following directories can be opened and ran as the project root in the following IDEs:

- Android Studio: `Android`, `base/android`, `base/flutter`
- Xcode: `iOS`, `base/ios`

In the `Android` root, the Flutter and Android SDKs must be set within the `local.properties` file.
```
sdk.dir=/path/to/Android/sdk
flutter.sdk=/path/to/flutter
```

`iOS/Flutter/FlutterConfig.xcconfig` must be created to run `iOS`
```
FLUTTER_ROOT=/path/to/flutter
FLUTTER_APPLICATION_PATH=</path/to/project/directory>/Flutter
FLUTTER_TARGET=lib/main.dart
FLUTTER_BUILD_MODE=debug
FLUTTER_BUILD_DIR=build
SYMROOT=${SOURCE_ROOT}
FLUTTER_FRAMEWORK_DIR=</path/to/flutter>/bin/cache/artifacts/engine/ios-release
PREVIEW_DART_2=true
```
Select the BaseApp target. In the project view, go to info and set the debug and release target files to `FlutterConfig.xcconfig`
