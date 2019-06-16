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
      body: Center(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Color(0xff7c94b6),
            image: DecorationImage(
              image: NetworkImage(data["picture"]["thumbnail"]),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(Radius.circular(75.0)),
            border: Border.all(
              color: Colors.red,
              width: 4.0
            )
          ),
        ),
      ),
    );
  }
}
