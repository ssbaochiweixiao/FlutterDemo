import 'package:flutter/material.dart';

class SettingsLHPage extends StatelessWidget {
  // 定义分组数据结构，每个分组包含组名和组内选项列表
  final List<Map<String, dynamic>> groups = [
    {
      "groupName": "Settings",
      "options": [
        {"title": "Clear Cache", "icon": Icons.delete, "action": () => print("Clear Cache tapped")}
      ]
    },
    {
      "groupName": "Legal",
      "options": [
        {"title": "Privacy Policy", "icon": Icons.security, "action": () => print("Privacy Policy tapped")},
        {"title": "Terms of Use", "icon": Icons.description, "action": () => print("Terms of Use tapped")}
      ]
    },
    {
      "groupName": "Legal",
      "options": [
        {"title": "Rate Us",
          "icon": Icons.star,
          "action": () => print("Rate Us tapped")},
        {"title": "Invite Friends",
          "icon": Icons.people,
          "action": () => print("Invite Friends tapped")},
        {"title": "About Us",
          "icon": Icons.info,
          "action": () => print("About Us tapped")}
      ]
    },
    {
      "groupName": "Legal",
      "options": [
        {"title": "Contact Us",
          "icon": Icons.email,
          "action": () => print("Contact Us tapped")}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      backgroundColor: Color(0xFFF7F9FA), // 设置整个页面的背景颜色为#F7F9FA
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, groupIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 显示组名，设置高度为56，文本居左下，底部内边距为8
              Container(
                height: 56,
                padding: EdgeInsets.fromLTRB(15, 0, 0, 8),
                alignment: Alignment.bottomLeft,
                child: Text(
                  groups[groupIndex]["groupName"],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              // 遍历组内选项并构建ListTile展示
              if (groups[groupIndex]["options"].length > 1)
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: groups[groupIndex]["options"].length,
                  itemBuilder: (context, optionIndex) {
                    bool isFirst = optionIndex == 0;
                    bool isLast = optionIndex == groups[groupIndex]["options"].length - 1;
                    return Container(
                      color: Colors.yellow,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: isFirst? Radius.circular(10) : Radius.zero,
                          bottom: isLast? Radius.circular(10) : Radius.zero,
                        ),
                        child: Material(
                          color: Colors.red,
                          child: ListTile(
                            leading: Icon(groups[groupIndex]["options"][optionIndex]["icon"]),
                            title: Text(groups[groupIndex]["options"][optionIndex]["title"]),
                            onTap: groups[groupIndex]["options"][optionIndex]["action"],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        color: Colors.red,
                        child: ListTile(
                          leading: Icon(groups[groupIndex]["options"][0]["icon"]),
                          title: Text(groups[groupIndex]["options"][0]["title"]),
                          onTap: groups[groupIndex]["options"][0]["action"],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}