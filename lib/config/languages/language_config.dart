import 'package:flutter/material.dart';
import 'package:recipes_app/config/languages/language.dart';

/// To add a language in the app, add a translation in csv file placed in assets/translations
/// Then, add a key, local and label below.
/// Set a default language using defaultLanguage variable.
class LanguageConfig {
  // Keys
  static const String _english = "english";
  static const String _urdu = "urdu";
  static const String _hindi = "hindi";
  static const List<String> _keys = [_english, _urdu, _hindi];

  // Locales
  static const Map<String, Locale> _locales = {
    _english: Locale('en'),
    _urdu: Locale('ur'),
    _hindi: Locale('hi'),
  };

  // Labels
  static const Map<String, String> _labels = {
    _english: "English",
    _urdu: "اردو",
    _hindi: "नहीं",
  };

  static Language defaultLanguage =
      Language(name: _labels[_english]!, locale: _locales[_english]!);
  static List<Language> get languages => _keys
      .map((key) => Language(name: _labels[key]!, locale: _locales[key]!))
      .toList();
  static List<Locale> get locales => _locales.values.toList();
}
