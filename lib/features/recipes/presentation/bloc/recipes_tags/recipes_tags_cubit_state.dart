part of 'recipes_tags_cubit_cubit.dart';

sealed class RecipesTagsCubitState extends Equatable {
  const RecipesTagsCubitState();

  @override
  List<Object> get props => [];
}

final class RecipesTagsCubitLoading extends RecipesTagsCubitState {
  const RecipesTagsCubitLoading();
}
