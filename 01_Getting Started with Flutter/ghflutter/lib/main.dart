import 'package:flutter/material.dart';

import 'strings.dart';

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Strings.appTitle),
        ),
        body: Center(
          child: Text(Strings.appTitle),
        ),
      ),
    );    
  }
}