import 'package:flutter/material.dart';
import 'package:eogretmen/resource/themeColors.dart';

class ThemeStyles {
  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: ThemeColors.BLACK,
      backgroundColor: ThemeColors.WHITE,
    );
  }
}
