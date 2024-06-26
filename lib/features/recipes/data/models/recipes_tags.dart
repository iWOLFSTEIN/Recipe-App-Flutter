import 'package:recipes_app/core/utils/helper_functions.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes_tags.dart';

class RecipesTagsResponse extends RecipesTagsResponseEntity {
  const RecipesTagsResponse({super.tags});

  factory RecipesTagsResponse.fromJson(json) {
    final recipesList = json;

    assert(recipesList is List<dynamic>?,
        'RecipesTagsResponse excpects recipesList to be List<dynamic>? but recieved ${typeOf(recipesList)}');

    return RecipesTagsResponse(
      tags: json as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tags': tags,
    };
  }
}
