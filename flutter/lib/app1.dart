import 'dart:async';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';

class StartupNameGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  // Channels and constants for retrieving app data
  static const dataPlatform = const MethodChannel('com.phillip.mobile.flutter.integration.base/AppData');
  static const DEFAULT_APP_TITLE = 'Flutter Title';
  static const DEFAULT_APP_TYPE = 'Unknown';
  String _appTitle = DEFAULT_APP_TITLE;
  String _appType = DEFAULT_APP_TYPE;

  // Channels for app navigation
  static const navPlatform = const MethodChannel('com.phillip.mobile.flutter.integration.base/AppNav');

  @override
  Widget build(BuildContext context) {
    _getAppType(); // Retrieve App Type from channel
    _getAppTitle(); // Retrieve App Title from channel
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('$_appType: $_appTitle'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved,)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  // Retrieves the App Type
  Future<Null> _getAppType() async {
    String type;
    try {
      final String result = await dataPlatform.invokeMethod('getType');
      type = result;
    } on PlatformException {
      type = DEFAULT_APP_TYPE;
    } on MissingPluginException {
      type = DEFAULT_APP_TYPE;
    }
    setState(() {
      _appType = type;
    });
  }

  // Retrieves the App Title
  Future<Null> _getAppTitle() async {
    String title;
    try {
      final String result = await dataPlatform.invokeMethod('getTitle');
      title = result;
    } on PlatformException {
      title = DEFAULT_APP_TITLE;
    } on MissingPluginException {
      title = DEFAULT_APP_TITLE;
    }
    setState(() {
      _appTitle = title;
    });
  }

  // Navigates to a Native Page displaying the current favorites
  Future<Null> _openNativeSaved() async {
    try {
      await navPlatform.invokeMethod('showFavorites', <String, dynamic>{
        "suggestions": _saved.map((pair) {
          return pair.asPascalCase;
        }).toList()
      });
    } on PlatformException {
      return showDialog<Null>(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
                title: new Text('Error!'),
                content: new Text('Unable to navigate to the native Android \'Show Favorites\' activity.')
            );
          }
      );
    }
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map((pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });
          final divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
              actions: <Widget>[
                new IconButton(icon: new Icon(Icons.filter_none), onPressed: _openNativeSaved,)
              ],
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        }
    );
  }
}