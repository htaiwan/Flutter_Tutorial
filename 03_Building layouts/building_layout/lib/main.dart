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

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, '電話'),
          _buildButtonColumn(color, Icons.near_me, '地圖'),
          _buildButtonColumn(color, Icons.share, '分享'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        // setting softwrap to true, text lines will fill the column width before wrapping at a word boundary.
        softWrap: true,
      ),
    );

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
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
    
  }

  // create a private helper method named buildButtonColumn(), 
  // which takes a color, an Icon and Text, and returns a column with its widgets painted in the given color.
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      // 靠越近越好
      mainAxisSize: MainAxisSize.min,
      // 置中擺放
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: color)
          ),
        )
      ],
    );
  }
}

