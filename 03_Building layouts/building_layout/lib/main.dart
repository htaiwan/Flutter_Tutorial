import 'package:flutter/material.dart';

import 'HomePage/TitleSection.dart';
import 'HomePage/ButtonSection.dart';
import 'HomePage/TextSection.dart';

void main() => runApp(MyApp());

// 範例：https://flutter.dev/docs/development/ui/layout/tutorial
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
  return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            TitleSection(),
            ButtonSection(),
            TextSection(),
          ],
        ),
      ),
    );
    
  }

}

