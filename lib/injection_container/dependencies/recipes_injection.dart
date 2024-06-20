import 'package:get_it/get_it.dart';
import 'package:recipes_app/features/recipes/data/datasource/remote/recipes_api.dart';
import 'package:recipes_app/features/recipes/data/repositories/recipes.dart';
import 'package:recipes_app/features/recipes/domain/repositories/recipes.dart';
import 'package:recipes_app/features/recipes/domain/usecases/recipes/get_recipes.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/recipes/recipes_bloc.dart';

final sl = GetIt.instance;

void initializeRecipesDependencies() {
  // Dependencies
  sl.registerSingleton<RecipesApi>(RecipesApi(sl()));
  sl.registerSingleton<RecipesRepo>(RecipesRepoImpl(sl()));

  // UseCases
  sl.registerSingleton<GetRecipesUseCase>(GetRecipesUseCase(sl<RecipesRepo>()));

  // Bloc
  sl.registerFactory<RecipesBloc>(() => RecipesBloc(sl<GetRecipesUseCase>()));
}
