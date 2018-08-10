import 'package:flutter/material.dart';

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hello World',
      home: new Scaffold(
        body: new Center(
          child: new Text('Hello World!')
        ),
      ),
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}