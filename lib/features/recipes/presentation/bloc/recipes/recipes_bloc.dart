import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';
import 'package:recipes_app/features/recipes/domain/usecases/recipes/get_recipes.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final GetRecipesUseCase _getRecipesUseCase;

  RecipesBloc(this._getRecipesUseCase) : super(const RecipesLoading()) {
    on<RecipesEvent>(onGetRecipes);
  }

  void onGetRecipes(RecipesEvent event, Emitter<RecipesState> emit) async {
    emit(const RecipesLoading());
    final dataState = await _getRecipesUseCase();
    if (dataState is DataSuccess) emit(RecipesDone(dataState.data!));
    if (dataState is DataFailed) emit(RecipesException(dataState.exception!));
  }
}
