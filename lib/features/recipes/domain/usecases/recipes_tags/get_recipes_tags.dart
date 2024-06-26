import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/core/usecases/usecase_async.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes_tags.dart';
import 'package:recipes_app/features/recipes/domain/repositories/recipes_tags.dart';

class GetRecipesTagsUseCase implements UseCaseAsync<DataState> {
  final RecipesTagsRepo _repo;
  const GetRecipesTagsUseCase(this._repo);

  @override
  Future<DataState<RecipesTagsResponseEntity>> call() async {
    return await _repo.getRecipesTags();
  }
}
