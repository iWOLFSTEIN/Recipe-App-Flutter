import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes_tags.dart';

abstract class RecipesTagsRepo {
  Future<DataState<RecipesTagsResponseEntity>> getRecipesTags();
}
