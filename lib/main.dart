import 'package:day01/Setting_lh_page_content.dart';
import 'package:flutter/material.dart';
import 'package:day01/home_page_content.dart';
import 'package:day01/setting_page_content.dart';
import 'package:day01/Setting_lh_page_content.dart';
import 'package:day01/test_home_content.dart';

// 公共
import 'utils/Extends.dart';
import 'utils/common.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize(context);

    return MaterialApp(
      title: "my simple layout",
      theme: ThemeData(

        appBarTheme: AppBarTheme(
            // color: Colors.white,
            centerTitle: false,
          titleTextStyle: TextStyle(
            color: ColorUtil.stringColor("#135142"), // 设置AppBar标题文字颜色，这里示例为白色
            fontSize: HYSizeFit.setRpx(24*2), // 设置AppBar标题文字大小
            fontFamily: Fonts.HSMedium
              // Theme.of(context).textTheme.headlineMedium,
          ),

          // titleTextStyle: Theme.of(context).textTheme.headlineMedium, // 引用TextTheme里的headline6样式
          // actionsIconTheme: IconThemeData(
          //   color: Colors.white,
          // ),
        ),
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
    SettingsLHPage(),
    SettingsPage(),
    HomePageContent(),
    SettingPageContent(),
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