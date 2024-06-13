import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/features/recipes/data/datasource/remote/recipes_api.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';
import 'package:recipes_app/features/recipes/domain/repositories/recipes.dart';

class RecipesRepoImpl implements RecipesRepo {
  final RecipesApi _recipesApi;
  RecipesRepoImpl(this._recipesApi);

  @override
  Future<DataState<RecipesResponseEntity>> getRecipes() async {
    return await _recipesApi.getRecipes();
  }
}
