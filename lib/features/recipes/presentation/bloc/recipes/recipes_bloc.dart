import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';
import 'package:recipes_app/features/recipes/domain/usecases/recipes/get_recipes.dart';
import 'package:recipes_app/features/recipes/domain/usecases/recipes/get_recipes_by_tags.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final GetRecipesUseCase _getRecipesUseCase;
  final GetRecipesByTagsUseCase _getRecipesByTagsUseCase;

  RecipesBloc(this._getRecipesUseCase, this._getRecipesByTagsUseCase)
      : super(const RecipesLoading()) {
    on<RecipesEvent>(onGetRecipes);
  }

  void onGetRecipes(RecipesEvent event, Emitter<RecipesState> emit) async {
    emit(const RecipesLoading());

    final DataState dataState;
    if (event.tag == null) {
      dataState = await _getRecipesUseCase();
    } else {
      dataState = await _getRecipesByTagsUseCase(tag: event.tag);
    }

    if (dataState is DataSuccess) emit(RecipesDone(dataState.data!));
    if (dataState is DataFailed) emit(RecipesException(dataState.exception!));
  }
}
