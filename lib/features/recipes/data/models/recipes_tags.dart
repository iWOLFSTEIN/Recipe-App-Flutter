import 'package:recipes_app/features/recipes/domain/entities/recipes_tags.dart';

class RecipesTagsResponse extends RecipesTagsResponseEntity {
  const RecipesTagsResponse({super.tags});

  factory RecipesTagsResponse.fromJson(List<dynamic> json) {
    return RecipesTagsResponse(
      tags: json as List<String>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tags': tags,
    };
  }
}
