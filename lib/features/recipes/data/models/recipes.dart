import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';

class RecipesResponse extends RecipesResponseEntity {
  const RecipesResponse({super.recipes});

  factory RecipesResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const RecipesResponse(recipes: null);
    return RecipesResponse(
      recipes: json['recipes'] != null
          ? List<Recipe>.from(
              json['recipes'].map((recipe) => Recipe.fromJson(recipe)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipes': recipes?.map((recipe) => (recipe as Recipe).toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [recipes];
}

class Recipe extends RecipeEntity {
  const Recipe({
    super.id,
    super.name,
    super.ingredients,
    super.instructions,
    super.prepTimeMinutes,
    super.cookTimeMinutes,
    super.servings,
    super.difficulty,
    super.cuisine,
    super.caloriesPerServing,
    super.tags,
    super.userId,
    super.image,
    super.rating,
    super.reviewCount,
    super.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const Recipe();
    }

    const String modelInfo = 'file: model/recipes.dart\n model: Recipe\n';

    final id = json['id'];
    final name = json['name'];
    final ingredients = json['ingredients'];
    final instructions = json['instructions'];
    final prepTimeMinutes = json['prepTimeMinutes'];
    final cookTimeMinutes = json['cookTimeMinutes'];
    final servings = json['servings'];
    final difficulty = json['difficulty'];
    final cuisine = json['cuisine'];
    final caloriesPerServing = json['caloriesPerServing'];
    final tags = json['tags'];
    final userId = json['userId'];
    final image = json['image'];
    final rating = json['rating'];
    final reviewCount = json['reviewCount'];
    final mealType = json['mealType'];

    assert(id is int?, '$modelInfo message: Expected id to be int?');
    assert(name is String?, '$modelInfo message: Expected name to be String?');
    assert(ingredients is List<dynamic>?,
        '$modelInfo message: Expected ingredients to be List<dynamic>?');
    assert(instructions is List<dynamic>?,
        '$modelInfo message: Expected instructions to be List<dynamic>?');
    assert(prepTimeMinutes is int?,
        '$modelInfo message: Expected prepTimeMinutes to be int?');
    assert(cookTimeMinutes is int?,
        '$modelInfo message: Expected cookTimeMinutes to be int?');
    assert(
        servings is int?, '$modelInfo message: Expected servings to be int?');
    assert(difficulty is String?,
        '$modelInfo message: Expected difficulty to be String?');
    assert(cuisine is String?,
        '$modelInfo message: Expected cuisine to be String?');
    assert(caloriesPerServing is int?,
        '$modelInfo message: Expected caloriesPerServing to be int?');
    assert(tags is List<dynamic>?,
        '$modelInfo message: Expected tags to be List<dynamic>?');
    assert(userId is int?, '$modelInfo message: Expected userId to be int?');
    assert(
        image is String?, '$modelInfo message: Expected image to be String?');
    assert(
        rating is double?, '$modelInfo message: Expected rating to be double?');
    assert(reviewCount is int?,
        '$modelInfo message: Expected reviewCount to be int?');
    assert(mealType is List<dynamic>?,
        '$modelInfo message: Expected mealType to be List<dynamic>?');

    return Recipe(
      id: id,
      name: name,
      ingredients: ingredients != null ? List<String>.from(ingredients) : null,
      instructions:
          instructions != null ? List<String>.from(instructions) : null,
      prepTimeMinutes: prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes,
      servings: servings,
      difficulty: difficulty,
      cuisine: cuisine,
      caloriesPerServing: caloriesPerServing,
      tags: tags != null ? List<String>.from(tags) : null,
      userId: userId,
      image: image,
      rating: rating,
      reviewCount: reviewCount,
      mealType: mealType != null ? List<String>.from(mealType) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'difficulty': difficulty,
      'cuisine': cuisine,
      'caloriesPerServing': caloriesPerServing,
      'tags': tags,
      'userId': userId,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'mealType': mealType,
    };
  }
}
