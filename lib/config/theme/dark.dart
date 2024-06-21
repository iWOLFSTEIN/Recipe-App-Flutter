import 'package:flutter/material.dart';
import 'package:recipes_app/config/theme/base.dart';
import 'package:recipes_app/core/constants/app_constants.dart';

class DarkTheme implements BaseTheme {
  @override
  final Color identity = Colors.black;
  @override
  final Color contrast = Colors.white;
  @override
  final Color primary = const Color(0xFFcaf0f8);
  @override
  final Color secondary = const Color(0xFF00b4d8);
  @override
  final Color surface = const Color(0xFF0077b6);
  @override
  final Color background = const Color(0xFF03045e);
  @override
  final Color primaryText = Colors.white;
  @override
  final Color secondaryText = Colors.grey.shade300.withOpacity(0.7);
  @override
  final Color border = Colors.grey.shade300;
  @override
  final Color icon = Colors.grey.shade300;
  @override
  final Color placeholder = Colors.grey.shade900;

  @override
  late final ThemeData themeData = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: identity,
        titleTextStyle: TextStyle(
          fontSize: AppConstants.font20Px,
          color: primaryText,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: identity,
        unselectedItemColor: secondaryText,
        selectedItemColor: secondary,
        selectedLabelStyle: const TextStyle(fontSize: AppConstants.font12Px),
      ),
      iconTheme: IconThemeData(color: contrast),
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(seedColor: primary));
}
