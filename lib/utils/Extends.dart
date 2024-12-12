import 'package:flutter/material.dart';
import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';


isIOS() {
  if (Platform.isIOS) {
    return true;
  } else {
    return false;
  }
}

/*大小适配------*/
class HYSizeFit {
  static late MediaQueryData _mediaQueryData; // 使用 late 关键字
  static late double screenWidth;
  static late double screenHeight;
  static late double rpx;
  static late double heightrpx;

  static void initialize(BuildContext context,
      {double standardWidth = 750, double standardHeight = 1334}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    rpx = screenWidth / standardWidth;
    heightrpx = screenHeight / standardHeight;
  }

  static double setRpx(double size) {
    return HYSizeFit.rpx * size;
  }

  static double setHeightRpx(double size) {
    return HYSizeFit.heightrpx * size;
  }
}

extension DoubleRpxExtension on double {
  double toRpx() {
    return HYSizeFit.rpx * this;
  }
}

extension IntRpxExtension on int {
  double toRpx() {
    return HYSizeFit.rpx * this;
  }
}
/*------*/

class ColorUtil {
  /// 十六进制颜色
  /// hex，十六进制值，例如：0xffffff，
  /// alpha，透明度[0.0, 1.0]
  static Color hexColor(int hex, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, alpha);
  }

  /// 十六进制颜色
  /// colorString，字符串，例如：'0x000000'  '0xff000000' '#000000' '#000000'，
  /// alpha，透明度[0.0, 1.0]
  static Color stringColor(String colorString, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    String colorStr = colorString;
    // colorString未带0xff前缀并且长度为6
    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff$colorStr';
    }
    // colorString为8位，如0x000000
    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }
    // colorString为7位，如#000000
    if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }
    // 先分别获取色值的RGB通道
    Color color = Color(int.parse(colorStr));
    int red = color.red;
    int green = color.green;
    int blue = color.blue;
    // 通过fromRGBO返回带透明度和RGB值的颜色
    return Color.fromRGBO(red, green, blue, alpha);
  }
}
class DeviceInfoUtil {
  /// 获取应用版本号
  static Future<String> getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> getAppShortVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  /// 获取iOS 的 bundleid
  static Future<String> getBundleId() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  /// 获取系统版本
  static Future<String> getSystemVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.systemVersion;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.release;
    }
    return "unKnown";
  }

  /// 获取设备类型
  static Future<String> getDeviceModel() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.model;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }
    return "unKnown";
  }

  static Future<void> getBuildVersion() async {
    try {
      late String currentAppVersion;
      late String currentBundleID;
      String currentAppBuildVersion = '';

      String appVersion = await DeviceInfoUtil.getAppShortVersion();
      currentAppBuildVersion = appVersion;
      // myPrint('---- currentAppBuildVersion:$currentAppBuildVersion');
    } catch (e) {}
  }
}