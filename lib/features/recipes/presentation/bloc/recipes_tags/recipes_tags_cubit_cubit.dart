import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipes_tags_cubit_state.dart';

class RecipesTagsCubitCubit extends Cubit<RecipesTagsCubitState> {
  RecipesTagsCubitCubit() : super(const RecipesTagsCubitLoading());
}
