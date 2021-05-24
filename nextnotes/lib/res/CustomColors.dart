import 'package:flutter/material.dart';

class CustomColors {
  static final Color firebaseNavy = Color(0xFF2C384A);
  static final Color firebaseOrange = Color(0xFFF57C00);
  static final Color firebaseAmber = Color(0xFFFFA000);
  static final Color firebaseYellow = Color(0xFFFFCA28);
  static final Color firebaseGrey = Color(0xFFECEFF1);
  static final Color googleBackground = Color(0xFF4285F4);

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    hexColor = hexColor.replaceAll('0X', '');
    if (hexColor.length == 6) {
     hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

}