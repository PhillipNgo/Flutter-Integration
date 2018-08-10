# Flutter Project Part
This directory represents the base Flutter project that will be used to intregrate from/into native Android/iOS projects.

The Dart code from this repository will be pulled from the `../Android` and `../iOS` projects as the Flutter part. 

## Dart Structure
There is a single `main.dart` that controls the application to open. This relies on a identifier that will be passed from a native project and will open one of the following:

- `app1.dart` is the [Startup Name Generator] (https://flutter.io/get-started/codelab/)
- `app2.dart` is a simple Hello World application.

If no identifier is supplied, it will open `app2.dart`.

## To Run

This project can also run standalone through Flutter through Android Studio with the Flutter SDK.
