import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';

abstract class RecipesRepo {
  Future<DataState<RecipesResponseEntity>> getRecipes();
}
