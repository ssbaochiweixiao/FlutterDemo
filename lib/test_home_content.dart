import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFF7F9FA), // 设置背景颜色为 #F7F9FA
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [


            // General Section
            SectionTitle(title: 'General'),
            CustomListTile(
              icon: Icons.delete,
              title: 'ClearCache',
              trailing: Text('0B', style: TextStyle(color: Colors.grey)),
            ),

            // Legal Section
            SectionTitle(title: 'Legal'),
            CustomListTile(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              trailing: Icon(Icons.chevron_right),
              addDivider: true,
            ),
            CustomListTile(
              icon: Icons.gavel,
              title: 'Terms of Use',
              trailing: Icon(Icons.chevron_right),
            ),

            // About Section
            SectionTitle(title: 'About'),
            CustomListTile(
              icon: Icons.thumb_up,
              title: 'Rate Us',
              trailing: Icon(Icons.chevron_right),
              addDivider: true,
            ),
            CustomListTile(
              icon: Icons.people,
              title: 'Invite Friends',
              trailing: Icon(Icons.chevron_right),
              addDivider: true,
            ),
            CustomListTile(
              icon: Icons.info,
              title: 'About Us',
              trailing: Icon(Icons.chevron_right),
              addDivider: true,
            ),
            CustomListTile(
              icon: Icons.restore,
              title: 'Restore',
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;
  final bool addDivider;

  const CustomListTile({
    required this.icon,
    required this.title,
    required this.trailing,
    this.addDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red, // 背景颜色
            borderRadius: BorderRadius.circular(12), // 设置圆角
          ),

          child: ListTile(
            leading: Icon(icon, color: Colors.grey),
            title: Text(title),
            trailing: trailing,
            onTap: () {},
          ),
        ),
        if (addDivider)
          Divider(
            height: 1,
            color: Colors.grey.shade300,
            indent: 15,
            endIndent: 15,
          ),
      ],
    );
  }
}
