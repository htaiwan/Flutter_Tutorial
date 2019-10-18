import 'package:flutter/material.dart';

import 'member.dart';

class MemberWidget extends StatefulWidget {

  final Member member;

  MemberWidget(this.member) {
    if (member == null) {
      throw ArgumentError("member of MemberWidget cannot be null. Received: '$member'");
    }
  }

@override
createState() => MemberState(member);
}

class MemberState extends State<MemberWidget> {
  final Member member;

  MemberState(this.member);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member.login),
      ),
      body: Column(
        children: [
          Image.network(member.avatarUrl),
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.green, size: 48.0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          RaisedButton(
            child: Text('Press ME'),
            onPressed: (){
              _showOKScreen(context);
            },
          )
        ],
      )
    );
  }

_showOKScreen(BuildContext context) async {
  //  push a new MaterialPageRoute onto the stack with a type parameter of bool
  //  using await when pushing the new route, which waits until the route is popped.
  //  the bool type parameter in MaterialPageRoute, which you can replace with any other type you want coming back from the route
  bool value = await Navigator.push(context, MaterialPageRoute<bool>(builder: (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(children: <Widget>[
        // In the calls to pop(), 
        // you pass a return value of true if the user tapped the “OK” text on the screen, and false if the user tapped “NOT OK”. 
        // If the user presses the back button instead, the value returned is null.
        GestureDetector(
          child: Text('OK'),
          onTap: () {
            Navigator.pop(context, true);
          }),
        GestureDetector(
          child: Text('Not OK'),
          onTap: () {
            Navigator.pop(context, false);
          })
      ]));
  }));

  var alert = AlertDialog(
    content: Text((value != null && value) ? "OK was pressed" : "NOT OK or BACK was pressed"),
    actions: <Widget>[
      FlatButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.pop(context);
        })
    ],
  );

  //  call showDialog() to show the alert
  showDialog(context: context, child: alert);
}

}