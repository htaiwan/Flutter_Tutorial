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
          )
        ],
      )
    );
  }
}