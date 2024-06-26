import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/core/resources/error_handler.dart';
import 'package:recipes_app/features/recipes/data/managers/remote/api_manager.dart';
import 'package:recipes_app/features/recipes/data/models/recipes_tags.dart';

class RecipesTagsApi {
  final ApiManager _apiManager;
  RecipesTagsApi(this._apiManager);

  Future<DataState<RecipesTagsResponse>> getRecipesTags() async {
    final DataState<RecipesTagsResponse> dataState =
        await ErrorHandler.onNetworkRequest<RecipesTagsResponse>(
            fetch: () async => RecipesTagsResponse.fromJson(await _apiManager
                .get(AppConstants.recipesTags) as List<dynamic>));
    return dataState;
  }
}
