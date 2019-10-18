import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'strings.dart';

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
  var _members = [];
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
          itemCount: _members.length,
          itemBuilder: (BuildContext context, int position) {
            return _buildRow(position);
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
      _members = json.decode(response.body);
    });
  }

  Widget _buildRow(int i) {
    return ListTile(
      title: Text("${_members[i]["login"]}", style: _biggerFont)
    );
  }
}