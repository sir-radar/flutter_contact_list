import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './contact_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://randomuser.me/api/?results=15";
  List data;

  Future makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "Application/json"});

    setState(() {
      var extractdata = jsonDecode(response.body);
      data = extractdata["results"];
    });
  }

  @override
  void initState() {
    makeRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i){
          return ListTile(
            title: Text(data[i]["name"]["first"]),
            subtitle: Text(data[i]["phone"]),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[i]["picture"]["thumbnail"]),
            ),
            onTap: (){

            },
          );
        },
      )
      );
  }
}
