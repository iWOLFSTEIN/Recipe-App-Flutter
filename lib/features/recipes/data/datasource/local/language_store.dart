import 'dart:convert';

import 'package:recipes_app/config/languages/language.dart';
import 'package:recipes_app/config/languages/language_config.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/features/recipes/data/managers/local/local_storage.dart';

class LanguageStore {
  final LocalStorageManager _manager;
  const LanguageStore(this._manager);

  Language getLanguage() {
    final String? storedLanguage =
        _manager.getString(key: AppConstants.language);
    if (storedLanguage == null) {
      return LanguageConfig.defaultLanguage;
    }
    return Language.fromJson(jsonDecode(storedLanguage));
  }

  Future<void> setLanguage({required Language language}) async {
    await _manager.setString(
        key: AppConstants.language, value: jsonEncode(language.toJson()));
  }
}
