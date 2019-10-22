
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



/*
  A mix-and-match approach：

  child是個StatefulWidget控制TapboxC highlight狀態
  parent是個StatefulWidget控制TapboxC active狀態

  An alternate implementation might have exported the highlight state to the parent while keeping the active state internal, 
    but if you asked someone to use that tap box, they’d probably complain that it doesn’t make much sense. 
    The developer cares whether the box is active. The developer probably doesn’t care how the highlighting is managed, 
    and prefers that the tap box handles those details.
*/

class ParentCWidget extends StatefulWidget {

  @override
  _ParentWidgetState createState() => _ParentWidgetState();

}

class _ParentWidgetState extends State<ParentCWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // parent利用child init方式將active狀態傳入給child
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged),
    );
  }

}

class TapboxC extends StatefulWidget {
  TapboxC( {Key key, this.active = false, @required this.onChanged} ) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  TapboxCState createState() => TapboxCState();
}

class TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp:  _handleTapUp,
      onPanCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white)),
          ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          // color是由parent控制
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          // border是由box自己控制
          border: _highlight
              ? Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}