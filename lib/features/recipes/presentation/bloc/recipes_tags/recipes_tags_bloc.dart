import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/core/resources/data_state.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes_tags.dart';
import 'package:recipes_app/features/recipes/domain/usecases/recipes_tags/get_recipes_tags.dart';

part 'recipes_tags_event.dart';
part 'recipes_tags_state.dart';

class RecipesTagsBloc extends Bloc<RecipesTagsEvent, RecipesTagsState> {
  final GetRecipesTagsUseCase _getRecipesTagsUseCase;
  RecipesTagsBloc(this._getRecipesTagsUseCase)
      : super(const RecipesTagsLoading()) {
    on<RecipesTagsEvent>(onGetRecipesTags);
  }

  void onGetRecipesTags(
      RecipesTagsEvent event, Emitter<RecipesTagsState> emit) async {
    emit(const RecipesTagsLoading());
    final dataState = await _getRecipesTagsUseCase();
    if (dataState is DataSuccess) emit(RecipesTagsDone(dataState.data!));
    if (dataState is DataFailed) {
      emit(RecipesTagsException(dataState.exception!));
    }
  }
}
