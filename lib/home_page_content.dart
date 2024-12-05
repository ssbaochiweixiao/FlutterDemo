import 'package:flutter/material.dart';
import 'package:day01/DetailPage.dart';

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome to HomePage"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> DetailPage()));
              },
              child: Text("detail"),
            ),
          ],
        ),
      ),
    );
  }
}
