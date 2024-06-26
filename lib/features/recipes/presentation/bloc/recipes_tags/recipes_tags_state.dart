part of 'recipes_tags_bloc.dart';

sealed class RecipesTagsState extends Equatable {
  final RecipesTagsResponseEntity? response;
  final Exception? exception;
  const RecipesTagsState({this.response, this.exception});

  @override
  List<Object> get props => [];
}

final class RecipesTagsLoading extends RecipesTagsState {
  const RecipesTagsLoading();
}

final class RecipesTagsDone extends RecipesTagsState {
  const RecipesTagsDone(RecipesTagsResponseEntity response)
      : super(response: response);
}

final class RecipesTagsException extends RecipesTagsState {
  const RecipesTagsException(Exception exception) : super(exception: exception);
}
