import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// The parent widget manages the widget’s state
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

   bool _active = false;
    void _handleTapBoxChanged(bool newValue) {
      // 狀態更新
      setState(() {
        _active = newValue;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Center(
      // parent利用child init方式將狀態傳入給child
      child: TapboxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
        ),
    );
  }
}

class TapboxB extends StatelessWidget {
  //  TapboxB exports its state to its parent through a callback. 
  //  Because TapboxB doesn’t manage any state, it subclasses StatelessWidget
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
