import 'package:flutter/material.dart';
import 'package:recipes_app/config/theme/base.dart';

class DarkTheme implements BaseTheme {
  @override
  final Color primary = const Color(0xFFcaf0f8);
  @override
  final Color secondary = const Color(0xFF00b4d8);
  @override
  final Color background = const Color(0xFF03045e);

  @override
  final ThemeData themeData = ThemeData();
}
