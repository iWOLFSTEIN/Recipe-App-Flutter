import 'package:flutter/material.dart';
import 'package:recipes_app/config/theme/base.dart';

class LightTheme implements BaseTheme {
  @override
  final Color primary = const Color(0xFF03045e);
  @override
  final Color secondary = const Color(0xFF00b4d8);
  @override
  final Color surface = const Color(0xFF90e0ef);
  @override
  final Color background = const Color(0xFFcaf0f8);

  @override
  late final ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(seedColor: primary));
}
