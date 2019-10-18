import 'package:flutter/material.dart';

import 'strings.dart';

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: GHFlutter(),
    );    
  }
}

class GHFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GHFlutterState();
  }
}

class GHFlutterState extends State<GHFlutter> {
  @override
  Widget build(BuildContext context) {
    // A Scaffold is a container for material design widgets. It acts as the root of a widget hierarchy.
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle) ,
        ),
        body: Text(Strings.appTitle),
    );
  }
}