import 'package:recipes_app/core/usecases/usecase.dart';
import 'package:recipes_app/features/recipes/domain/repositories/theme.dart';

class GetThemeUseCase implements UseCase<String> {
  final ThemeRepo _repo;
  const GetThemeUseCase(this._repo);

  @override
  String call() {
    return _repo.getTheme();
  }
}
