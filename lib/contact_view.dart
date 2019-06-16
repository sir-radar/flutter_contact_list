import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  ContactView(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact Details"),
        ),
        body: Column(
          children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 60.0),
              child: Text(data["name"]["first"].toUpperCase(), 
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                ),
                ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(data["phone"]),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Color(0xff7c94b6),
                  image: DecorationImage(
                      image: NetworkImage(data["picture"]["large"]),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  border: Border.all(color: Colors.red, width: 4.0)),
            ),
          ),
        ]));
  }
}
