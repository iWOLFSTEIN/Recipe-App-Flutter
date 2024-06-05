import 'package:recipes_app/config/languages/language.dart';
import 'package:recipes_app/core/usecases/usecase.dart';
import 'package:recipes_app/features/recipes/domain/repositories/language.dart';

class GetLanguageUseCase implements UseCase<Language> {
  final LanguageRepo _repo;
  const GetLanguageUseCase(this._repo);

  @override
  Language call() {
    return _repo.getLanguage();
  }
}
