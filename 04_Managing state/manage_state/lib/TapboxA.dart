import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Case 1: The widget manages its own state
// https://flutter.dev/docs/development/ui/interactive#self-managed
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  // Defines the _active boolean which determines the box’s current color.
    bool _active = false;
  // Defines the _handleTap() function, which updates _active when the box is tapped and calls the setState() function to update the UI.
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'InActive',
            style: TextStyle(fontSize: 32.0, color: Colors.green), 
            ),
          ),
        ),
      );
  }
}