import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/features/recipes/data/datasource/remote/recipes_tags_api.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes_tags.dart';
import 'package:recipes_app/features/recipes/domain/repositories/recipes_tags.dart';

class RecipesTagsRepoImpl implements RecipesTagsRepo {
  final RecipesTagsApi _recipesTagsApi;
  RecipesTagsRepoImpl(this._recipesTagsApi);

  @override
  Future<DataState<RecipesTagsResponseEntity>> getRecipesTags() async {
    return await _recipesTagsApi.getRecipesTags();
  }
}
