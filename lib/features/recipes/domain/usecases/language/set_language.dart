import 'package:recipes_app/config/languages/language.dart';
import 'package:recipes_app/core/usecases/usecase_async.dart';
import 'package:recipes_app/features/recipes/domain/repositories/language.dart';

class SetLanguageUseCase implements UseCaseAsync<void> {
  final LanguageRepo _repo;
  const SetLanguageUseCase(this._repo);

  @override
  Future<void> call({Language? language}) async {
    return _repo.setLanguage(language: language!);
  }
}
