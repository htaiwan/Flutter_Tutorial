import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 範例：https://flutter.dev/docs/development/ui/layout/tutorial
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Implement the title row
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      // Row with 3 children
      child: Row(
        children: <Widget>[
          // 標題 + 地址
          // Putting a Column inside an Expanded widget stretches the column to use all remaining free space in the row. 
          Expanded(
            child: Column(
              // Setting the crossAxisAlignment property to CrossAxisAlignment.start positions the column at the start of the row.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '這是標題',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '這是地址',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 星星符號
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),

          // 星星數字
          Text('978'),
        ],
      ),

    );

    
  }
}

