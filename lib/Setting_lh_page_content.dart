import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:day01/constants.dart';

class SettingsLHPage extends StatefulWidget {
  @override
  _SettingsLHPageState createState() => _SettingsLHPageState();
}

class _SettingsLHPageState extends State<SettingsLHPage> {
  bool _isPremiumSectionVisible = true; // 用于控制Premium组是否可见

  // 页面相关代码逻辑...

  // 定义分组数据结构，每个分组包含组名和组内选项列表
  final List<Map<String, dynamic>> groups = [
    {
      "groupName": "General",
      "options": [
        {
          "title": AppConstants.clearCacheText,
          "icon": Icons.delete,
          "action": () => print("Rate Us tapped"),
          "subTitle": ""
        }
      ]
    },
    {
      "groupName": "Legal",
      "options": [
        {
          "title": AppConstants.privacyPolicyText,
          "icon": Icons.security,
          "action": () => {}
        },
        {
          "title": AppConstants.termsOfUseText,
          "icon": Icons.description,
          "action": () => print("Terms of Use tapped")
        }
      ]
    },
    {
      "groupName": "About",
      "options": [
        {
          "title": AppConstants.rateUsText,
          "icon": Icons.star,
          "action": () => print("Rate Us tapped")
        },
        {
          "title": AppConstants.inviteFriendsText,
          "icon": Icons.people,
          "action": () => print("Invite Friends tapped")
        },
        {
          "title": AppConstants.aboutUsText,
          "icon": Icons.info,
          "action": () => print("About Us tapped")
        }
      ]
    },
    {
      "groupName": "Legal",
      "options": [
        {
          "title": AppConstants.restoreText,
          "icon": Icons.email,
          "action": () => print("Contact Us tapped")
        }
      ]
    },
  ];

  // 定义分组数据结构，每个分组包含组名和组内选项列表
  final List<Map<String, dynamic>> groupsDefault = [
    {
      "groupName": "General",
      "options": [
        {
          "title": AppConstants.clearCacheText,
          "icon": Icons.delete,
          "action": () => print("Rate Us tapped"),
          "subTitle": ""
        }
      ]
    },
    {
      "groupName": "Legal",
      "options": [
        {
          "title": AppConstants.privacyPolicyText,
          "icon": Icons.security,
          "action": () => {}
        },
        {
          "title": AppConstants.termsOfUseText,
          "icon": Icons.description,
          "action": () => print("Terms of Use tapped")
        }
      ]
    },
    {
      "groupName": "About",
      "options": [
        {
          "title": AppConstants.rateUsText,
          "icon": Icons.star,
          "action": () => print("Rate Us tapped")
        },
        {
          "title": AppConstants.inviteFriendsText,
          "icon": Icons.people,
          "action": () => print("Invite Friends tapped")
        },
        {
          "title": AppConstants.aboutUsText,
          "icon": Icons.info,
          "action": () => print("About Us tapped")
        },
        {
          "title": AppConstants.restoreText,
          "icon": Icons.info,
          "action": () => print("Restore")
        }
      ]
    },
  ];

  // 定义一个函数类型的变量，用于保存更新缓存大小的方法
  late Function _updateCacheSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      backgroundColor: Color(0xFFF7F9FA), // 设置整个页面的背景颜色为#F7F9FA
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),

        itemCount: _isPremiumSectionVisible == true
            ? groupsDefault.length + 1
            : groups.length, // 增加一项用于展示Premium Plan区域

        itemBuilder: (context, groupIndex) {
          // 订阅banner
          if (groupIndex == 0 && _isPremiumSectionVisible) {
            // 未订阅
            return Visibility(
              visible: _isPremiumSectionVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 54,
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Premium",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF737373),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/img_set_card_bg@2x.png'),
                        // 替换为你实际的图片路径
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Premiums Plan',
                              style: TextStyle(
                                color: Color(0xFF135142),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Unlock and Become a Premium Member',
                              style: TextStyle(
                                color: Color(0xFF135142),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              height: 32,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text('Get Now!'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                ],
              ),
            );
            // 在这里添加Premium Plan Section相关代码
          } else {
            final List<Map<String, dynamic>> currentGroups =
                _isPremiumSectionVisible ? groupsDefault : groups;
            int index = _isPremiumSectionVisible ? groupIndex - 1 : groupIndex;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 显示组名，设置高度为56，文本居左下，底部内边距为8
                Container(
                  height: 54,
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    currentGroups[index]["groupName"],
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF737373),
                    ),
                  ),
                ),
                // 遍历组内选项并构建ListTile展示
                if (currentGroups[index]["options"].length > 1)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: currentGroups[index]["options"].length,
                    itemBuilder: (context, optionIndex) {
                      bool isFirst = optionIndex == 0;
                      bool isLast = optionIndex ==
                          currentGroups[index]["options"].length - 1;

                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 55,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: isFirst ? Radius.circular(10) : Radius.zero,
                            bottom: isLast ? Radius.circular(10) : Radius.zero,
                          ),
                          child: ListTileCreateUI(context,
                              currentGroups[index]["options"][optionIndex]),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 0,
                      color: Color(0xFFF5F5F5),
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
                        child: ListTileCreateUI(
                            context, currentGroups[index]["options"][0]),
                      ),
                    ),
                  ),
              ],
            );
          }
        },
      ),
    );
  }

  // 定义方法来获取ListView的itemCount值
  int getListViewItemCount() {
    if (_isPremiumSectionVisible) {
      return groupsDefault.length + 1;
    }
    return groups.length;
  }

  void _togglePremiumSectionVisibility() {
    setState(() {
      print(111);
      _isPremiumSectionVisible = !_isPremiumSectionVisible;
    });
  }

// 新添加共用方法，用于处理选项点击事件的通用逻辑
  void handleOptionTap(String optionTitle, Function action) {
    print('用户点击了: $optionTitle'); // 可以在这里记录操作日志，比如打印出点击的选项名称

    if (optionTitle == AppConstants.clearCacheText) {
      _clearCache();
    } else if (optionTitle == AppConstants.privacyPolicyText) {
      _togglePremiumSectionVisibility();
    } else if (optionTitle == AppConstants.termsOfUseText) {
    } else if (optionTitle == AppConstants.rateUsText) {
    } else if (optionTitle == AppConstants.inviteFriendsText) {
    } else if (optionTitle == AppConstants.aboutUsText) {
    } else if (optionTitle == AppConstants.restoreText) {}

    // 这里可以添加更多通用逻辑，比如显示一个简单的提示信息（实际项目中可能用SnackBar等更好的方式来显示提示）
    print('执行对应操作前的一些通用准备工作...');

    action(); // 执行具体选项对应的原始操作函数

    print('操作执行完毕，可以进行一些后续的通用处理，比如更新UI等');
    // 例如，若后续有需要统一更新界面某些状态等操作，可以在这里添加相关逻辑
  }

  void _clearCache() async {
    try {
      Directory cacheDir = await getTemporaryDirectory();
      if (await cacheDir.exists()) {
        // 判断缓存目录是否存在
        await cacheDir.delete(recursive: true);
        _updateCacheSize();
        print('缓存已清除');
      } else {
        print('缓存目录不存在，无需清除');
      }
    } catch (e) {
      print('清除缓存出错: $e');
    }
  }

  Future<String> _getCacheSize() async {
    try {
      Directory cacheDir = await getTemporaryDirectory();
      if (await cacheDir.exists()) {
        // 判断缓存目录是否存在
        int totalSize = 0;
        await for (var file in cacheDir.list(recursive: true)) {
          if (file is File) {
            totalSize += file.lengthSync();
          }
        }
        // 将字节大小转换为合适的单位（如KB、MB等）并格式化显示
        return _formatSize(totalSize);
      } else {
        return '0 KB';
      }
    } catch (e) {
      print('获取缓存大小出错: $e');
      return '获取缓存大小出错 未知';
    }
  }

  // 辅助方法，用于格式化文件大小显示
  String _formatSize(int size) {
    if (size < 1024) {
      return '$size B';
    } else if (size < 1024 * 1024) {
      return '${(size / 1024).toStringAsFixed(2)} KB';
    } else if (size < 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else {
      return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }

  // 新创建的方法，用于构建ListTile，根据hasRightText决定trailing显示内容，
// 针对Clear Cache选项特殊处理以展示缓存信息
  Widget ListTileCreateUI(BuildContext context, Map<String, dynamic> option) {
    if (option["title"] == AppConstants.clearCacheText) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          _updateCacheSize = () {
            setState(() {});
          };
          return FutureBuilder<String>(
            future: _getCacheSize(),
            builder: (context, snapshot) {
              String cacheSizeText =
                  snapshot.hasData ? snapshot.data! : '获取中...';
              return Material(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(option["icon"]),
                  title: Text(option["title"]),
                  trailing: Text(cacheSizeText),
                  onTap: () => handleOptionTap(
                      option["title"], option["action"]), // 同样使用共用方法，传入对应参数

                  // onTap: _clearCache,
                ),
              );
            },
          );
        },
      );
    } else {
      return Material(
        color: Colors.white,
        child: ListTile(
          leading: Icon(option["icon"]),
          title: Text(option["title"]),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          // onTap: _togglePremiumSectionVisibility,
          onTap: () => handleOptionTap(
              option["title"], option["action"]), // 同样使用共用方法，传入对应参数
        ),
      );
    }
  }
}
