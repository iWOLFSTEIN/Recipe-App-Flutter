import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/core/usecases/usecase_async.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';
import 'package:recipes_app/features/recipes/domain/repositories/recipes.dart';

class GetRecipesUseCase implements UseCaseAsync<DataState> {
  final RecipesRepo _repo;
  const GetRecipesUseCase(this._repo);

  @override
  Future<DataState<RecipesResponseEntity>> call() async {
    return await _repo.getRecipes();
  }
}
