import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("detailPage")),
      body: Center(
        child: Text("this is detail",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}