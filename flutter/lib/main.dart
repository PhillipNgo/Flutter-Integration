import 'app1.dart';
import 'app2.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  handleEntry();
}

Future<Null> handleEntry() async {
  const entryPlatform = const MethodChannel('com.phillip.mobile.flutter.integration.base/Entry');
  try {
    final String result = await entryPlatform.invokeMethod('getEntryPoint');
    switch (result) {
      case "FlutterEntry1":
        runApp(new StartupNameGenerator());
        break;
      case "FlutterEntry2":
      default:
        runApp(new HelloWorldApp());
    }
  } on Exception {
    runApp(new HelloWorldApp());
  }
}
