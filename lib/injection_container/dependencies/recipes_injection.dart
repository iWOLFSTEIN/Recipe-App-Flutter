import 'package:get_it/get_it.dart';
import 'package:recipes_app/features/recipes/data/datasource/remote/recipes_api.dart';
import 'package:recipes_app/features/recipes/data/datasource/remote/recipes_tags_api.dart';
import 'package:recipes_app/features/recipes/data/repositories/recipes.dart';
import 'package:recipes_app/features/recipes/data/repositories/recipes_tags.dart';
import 'package:recipes_app/features/recipes/domain/repositories/recipes_tags.dart';
import 'package:recipes_app/features/recipes/domain/usecases/recipes/get_recipes.dart';
import 'package:recipes_app/features/recipes/domain/usecases/recipes/get_recipes_by_tags.dart';
import 'package:recipes_app/features/recipes/domain/usecases/recipes_tags/get_recipes_tags.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/recipes/recipes_bloc.dart';
import 'package:recipes_app/features/recipes/domain/repositories/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/recipes_tags/recipes_tags_bloc.dart';

final sl = GetIt.instance;

void initializeRecipesDependencies() {
  // Dependencies
  sl.registerSingleton<RecipesApi>(RecipesApi(sl()));
  sl.registerSingleton<RecipesRepo>(RecipesRepoImpl(sl()));
  sl.registerSingleton<RecipesTagsApi>(RecipesTagsApi(sl()));
  sl.registerSingleton<RecipesTagsRepo>(RecipesTagsRepoImpl(sl()));

  // UseCases
  sl.registerSingleton<GetRecipesUseCase>(GetRecipesUseCase(sl<RecipesRepo>()));
  sl.registerSingleton<GetRecipesTagsUseCase>(
      GetRecipesTagsUseCase(sl<RecipesTagsRepo>()));
  sl.registerSingleton<GetRecipesByTagsUseCase>(
      GetRecipesByTagsUseCase(sl<RecipesRepo>()));

  // Bloc
  sl.registerFactory<RecipesBloc>(() =>
      RecipesBloc(sl<GetRecipesUseCase>(), sl<GetRecipesByTagsUseCase>()));
  sl.registerFactory<RecipesTagsBloc>(
      () => RecipesTagsBloc(sl<GetRecipesTagsUseCase>()));
}
