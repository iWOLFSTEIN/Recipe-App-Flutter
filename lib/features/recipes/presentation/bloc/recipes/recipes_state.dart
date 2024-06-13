part of 'recipes_bloc.dart';

sealed class RecipesState extends Equatable {
  final RecipesResponseEntity? response;
  final Exception? exception;
  const RecipesState({this.response, this.exception});

  @override
  List<Object> get props => [];
}

final class RecipesLoading extends RecipesState {
  const RecipesLoading();
}

final class RecipesDone extends RecipesState {
  const RecipesDone(RecipesResponseEntity response) : super(response: response);
}

final class RecipesException extends RecipesState {
  const RecipesException(Exception exception) : super(exception: exception);
}
