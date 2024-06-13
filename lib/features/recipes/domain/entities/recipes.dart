import 'package:equatable/equatable.dart';

class RecipesResponseEntity extends Equatable {
  final List<RecipeEntity>? recipes;

  const RecipesResponseEntity({this.recipes});

  @override
  List<Object?> get props => [recipes];
}

class RecipeEntity extends Equatable {
  final int? id;
  final String? name;
  final List<String>? ingredients;
  final List<String>? instructions;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final int? servings;
  final String? difficulty;
  final String? cuisine;
  final int? caloriesPerServing;
  final List<String>? tags;
  final int? userId;
  final String? image;
  final double? rating;
  final int? reviewCount;
  final List<String>? mealType;

  const RecipeEntity({
    this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.difficulty,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.userId,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        ingredients,
        instructions,
        prepTimeMinutes,
        cookTimeMinutes,
        servings,
        difficulty,
        cuisine,
        caloriesPerServing,
        tags,
        userId,
        image,
        rating,
        reviewCount,
        mealType,
      ];
}
