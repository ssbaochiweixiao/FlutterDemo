import 'package:day01/Setting_lh_page_content.dart';
import 'package:flutter/material.dart';
import 'package:day01/home_page_content.dart';
import 'package:day01/setting_page_content.dart';
import 'package:day01/Setting_lh_page_content.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my simple layout",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.red,
            centerTitle: false
        ),

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
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePageContent(),
    SettingPageContent(),
    SettingsLHPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          print("you click ${index + 1}");
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "settings lh",
          ),
        ],
      ),
    );
  }
}