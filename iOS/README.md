# Summary
The Flutter portion of this app can be found in the `../base/flutter` directory.

## To Run
With the Flutter SDK installed, this project runs just like a regular native project.
- Open this project in Xcode
- Create `FlutterConfig.xcconfig` in the `Flutter` group/directory
```
FLUTTER_ROOT=/path/to/flutter
FLUTTER_APPLICATION_PATH=</path/to/project/directory>/iOS-2/Flutter
FLUTTER_TARGET=lib/main.dart
FLUTTER_BUILD_MODE=debug
FLUTTER_BUILD_DIR=build
SYMROOT=${SOURCE_ROOT}
FLUTTER_FRAMEWORK_DIR=</path/to/flutter>/bin/cache/artifacts/engine/ios-release
PREVIEW_DART_2=true
```
- Select the BaseApp target. In the project view, go to info and set the debug and release target files to `FlutterConfig.xcconfig`
- Run on device/simulator
