part of 'recipes_bloc.dart';

sealed class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class GetRecipes extends RecipesEvent {
  const GetRecipes();
}
