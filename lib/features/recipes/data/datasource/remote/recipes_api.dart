import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/core/resources/error_handler.dart';
import 'package:recipes_app/features/recipes/data/managers/remote/api_manager.dart';
import 'package:recipes_app/features/recipes/data/models/recipes.dart';

class RecipesApi {
  final ApiManager _apiManager;
  RecipesApi(this._apiManager);

  Future<DataState<RecipesResponse>> getRecipes() async {
    final DataState<RecipesResponse> dataState =
        await ErrorHandler.onNetworkRequest<RecipesResponse>(
            fetch: () async => RecipesResponse.fromJson(
                await _apiManager.get(AppConstants.recipes)));
    return dataState;
  }

  Future<DataState<RecipesResponse>> getRecipesByTag(String tag) async {
    final DataState<RecipesResponse> dataState =
        await ErrorHandler.onNetworkRequest<RecipesResponse>(
            fetch: () async => RecipesResponse.fromJson(
                await _apiManager.get(AppConstants.recipesByTags(tag))));
    return dataState;
  }
}
