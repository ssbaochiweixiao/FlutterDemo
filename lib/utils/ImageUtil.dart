import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

AssetImage getAssetImage(String fileName) {
  // 假设所有图片都在assets/images/目录下，你可以根据实际情况修改路径
  String imagePath = 'assets/images/$fileName';
  return AssetImage(imagePath);
}