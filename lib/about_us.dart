import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FA), // 设置整个页面的背景颜色为#F7F9FA

      appBar: AppBar(
        // leading: IconButton(
        //   icon: Image.asset('images/ic_title_back_black.png'),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // backgroundColor: ColorUtil.stringColor('#FFFFFF'),
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            // fontFamily: Fonts.HSRegular,
          ),),
      ),
      body: Center(

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 102), // 使用SizedBox来空出100像素的空间，相当于距离顶部100
            Image(
              image: AssetImage("assets/images/about_us_logo@2x.png"),
              width: 90,
              height: 90,
            ),
            SizedBox(height: 28), // 使用SizedBox来空出100像素的空间，相当于距离顶部100
            Text("AI Plant Identifier",
            style:TextStyle(
              color: Color(0xFF171717),
              fontSize: 20,
            ),),
            SizedBox(height: 8),
            Text("Version :1.0.0",
            style: TextStyle(
              color: Color(0xFF737373),
              fontSize: 16,
            ),),

            // 使用SizedBox来空出100像素的空间，相当于距离顶部100

            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context)=> DetailPage()));
            //   },
            //   child: Text("detail"),
            // ),
          ],
        ),
      ),
    );
  }
}
