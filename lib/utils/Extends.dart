import 'package:flutter/material.dart';
import 'dart:io';





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

  static bool smallPhone() {
    if (isIOS()) {
      if (HYSizeFit.screenWidth / HYSizeFit.screenHeight > 0.5) {
        return true;
      }
    } else {
      if (HYSizeFit.screenHeight <= 732) {
        return true;
      }
    }
    return false;
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
