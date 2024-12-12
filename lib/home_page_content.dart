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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailPage()));
              },
              child: Text("detail"),
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(50.0),
              children: <Widget>[
                const Text('I\'m dedicating every day to you'),
                const Text('Domestic life was never quite my style'),
                const Text('When you smile, you knock me out, I fall apart'),
                const Text('And I thought I was so smart'),
              ],
            ),
            ListView.builder(
                itemCount: 100,
                itemExtent: 50.0, //强制高度为50.0
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("$index"));
                }),



          ],
        ),
      ),
    );
  }
}
