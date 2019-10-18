import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'strings.dart';
import 'member.dart';

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: GHFlutter(),
    );    
  }
}

class GHFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GHFlutterState();
  }
}

class GHFlutterState extends State<GHFlutter> {
  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  // calls _loadData() when the state is initialized:
  void initState() {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    // A Scaffold is a container for material design widgets. It acts as the root of a widget hierarchy.
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle) ,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return Divider();
            final index = position ~/2;
            return _buildRow(index);
          },
        ),
    );
  }

  // async: tell Dart that it’s asynchronous,
  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    // await: wait on the http.get()的response
    http.Response response = await http.get(dataURL);
    // pass a callback to setState() that runs synchronously on the UI thread. I
    setState(() {
      final membersJSON = json.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text("${_members[i].login}", style: _biggerFont),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[i].avatarUrl)
        ),
      )
    );
  }
}