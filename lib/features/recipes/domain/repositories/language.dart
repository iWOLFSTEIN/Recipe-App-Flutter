import 'package:recipes_app/config/languages/language.dart';

abstract class LanguageRepo {
  Language getLanguage();
  Future<void> setLanguage({required Language language});
}
