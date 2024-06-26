part of 'recipes_tags_bloc.dart';

sealed class RecipesTagsEvent extends Equatable {
  const RecipesTagsEvent();

  @override
  List<Object> get props => [];
}

class GetRecipesTags extends RecipesTagsEvent {
  const GetRecipesTags();
}
