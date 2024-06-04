import 'package:recipes_app/core/usecases/usecase_async.dart';
import 'package:recipes_app/features/recipes/domain/repositories/theme.dart';

class SetThemeUseCase implements UseCaseAsync<void> {
  final ThemeRepo _repo;
  const SetThemeUseCase(this._repo);

  @override
  Future<void> call({String? theme}) async {
    return _repo.setTheme(theme: theme!);
  }
}
