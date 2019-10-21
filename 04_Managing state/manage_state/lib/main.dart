import 'package:flutter/material.dart';

import 'TapboxA.dart';
import 'TapboxB.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage2(),
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The widget manages its own state'),
      ),
      body: Center(
        child: TapboxA(),
      ),
    );
  }  
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The parent widget manages the widget’s state'),
      ),
      body: Center(
        child: ParentWidget(),
      ),
    );
  }  
}