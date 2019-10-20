import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, '電話'),
          _buildButtonColumn(color, Icons.near_me, '地圖'),
          _buildButtonColumn(color, Icons.share, '分享'),
        ],
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
          child: Text(label,
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 12, color: color)),
        )
      ],
    );
  }
}
