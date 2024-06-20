import 'package:recipes_app/core/utils/helper_functions.dart';
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
    final rating = json['rating']?.toDouble();
    final reviewCount = json['reviewCount'];
    final mealType = json['mealType'];

    assert(
        id is int?, 'Recipe excpects id to be int? but recieved ${typeOf(id)}');
    assert(name is String?,
        'Recipe excpects name to be String? but recieved ${typeOf(id)}');
    assert(ingredients is List<dynamic>?,
        'Recipe excpects ingredients to be List<dynamic>? but recieved ${typeOf(id)}');
    assert(instructions is List<dynamic>?,
        'Recipe excpects instructions to be List<dynamic>? but recieved ${typeOf(id)}');
    assert(prepTimeMinutes is int?,
        'Recipe excpects prepTimeMinutes to be int? but recieved ${typeOf(id)}');
    assert(cookTimeMinutes is int?,
        'Recipe excpects cookTimeMinutes to be int? but recieved ${typeOf(id)}');
    assert(servings is int?,
        'Recipe excpects servings to be int? but recieved ${typeOf(id)}');
    assert(difficulty is String?,
        'Recipe excpects difficulty to be String? but recieved ${typeOf(id)}');
    assert(cuisine is String?,
        'Recipe excpects cuisine to be String? but recieved ${typeOf(id)}');
    assert(caloriesPerServing is int?,
        'Recipe excpects caloriesPerServing to be int? but recieved ${typeOf(id)}');
    assert(tags is List<dynamic>?,
        'Recipe excpects tags to be List<dynamic>? but recieved ${typeOf(id)}');
    assert(userId is int?,
        'Recipe excpects userId to be int? but recieved ${typeOf(id)}');
    assert(image is String?,
        'Recipe excpects image to be String? but recieved ${typeOf(id)}');
    assert(rating is double?,
        'Recipe excpects rating to be double? but recieved ${typeOf(id)}');
    assert(reviewCount is int?,
        'Recipe excpects reviewCount to be int? but recieved ${typeOf(id)}');
    assert(mealType is List<dynamic>?,
        'Recipe excpects mealType to be List<dynamic>?');

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
