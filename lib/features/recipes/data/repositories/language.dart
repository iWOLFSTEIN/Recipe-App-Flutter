import 'package:recipes_app/config/languages/language.dart';
import 'package:recipes_app/features/recipes/data/datasource/local/language_store.dart';
import 'package:recipes_app/features/recipes/domain/repositories/language.dart';

class LanguageRepoImpl implements LanguageRepo {
  late final LanguageStore _languageStore;
  LanguageRepoImpl(this._languageStore);

  @override
  Language getLanguage() {
    return _languageStore.getLanguage();
  }

  @override
  Future<void> setLanguage({required Language language}) async {
    await _languageStore.setLanguage(language: language);
  }
}
