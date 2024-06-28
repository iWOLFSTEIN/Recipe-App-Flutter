part of 'recipes_bloc.dart';

sealed class RecipesEvent extends Equatable {
  final String? tag;
  const RecipesEvent({this.tag});

  @override
  List<Object> get props => [];
}

class GetRecipes extends RecipesEvent {
  const GetRecipes({super.tag});
}
