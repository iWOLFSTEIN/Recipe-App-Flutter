import 'package:flutter/material.dart';

abstract class BaseTheme {
  Color get identity;
  Color get contrast;
  Color get primary;
  Color get secondary;
  Color get surface;
  Color get background;
  Color get primaryText;
  Color get secondaryText;
  Color get border;
  Color get icon;
  Color get placeholder;

  ThemeData get themeData;
}
