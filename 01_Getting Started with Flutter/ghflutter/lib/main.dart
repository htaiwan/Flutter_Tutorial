import 'package:flutter/material.dart';

import 'ghflutter.dart';
import 'strings.dart';

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.pink.shade800),
      home: GHFlutter(),
    );    
  }
}
