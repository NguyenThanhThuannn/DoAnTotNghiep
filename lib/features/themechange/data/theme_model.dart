import 'package:flutter/material.dart';

import 'theme.dart';
class ThemeModel {
  final ThemeData themeData;

  ThemeModel({required this.themeData});

  factory ThemeModel.light() {
    return ThemeModel(themeData: lightTheme);
  }

  factory ThemeModel.dark() {
    return ThemeModel(themeData: darkTheme);
  }
}