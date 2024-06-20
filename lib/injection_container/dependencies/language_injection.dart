import 'package:get_it/get_it.dart';
import 'package:recipes_app/features/recipes/data/datasource/local/language_store.dart';
import 'package:recipes_app/features/recipes/data/managers/local/local_storage.dart';
import 'package:recipes_app/features/recipes/data/repositories/language.dart';
import 'package:recipes_app/features/recipes/domain/repositories/language.dart';
import 'package:recipes_app/features/recipes/domain/usecases/language/get_language.dart';
import 'package:recipes_app/features/recipes/domain/usecases/language/set_language.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/language/language_bloc.dart';

final sl = GetIt.instance;

void initializeLanguageDependencies() {
  // Dependencies
  sl.registerSingleton<LanguageStore>(LanguageStore(sl<LocalStorageManager>()));
  sl.registerSingleton<LanguageRepo>(LanguageRepoImpl(sl<LanguageStore>()));

  // UseCases
  sl.registerSingleton<GetLanguageUseCase>(
      GetLanguageUseCase(sl<LanguageRepo>()));
  sl.registerSingleton<SetLanguageUseCase>(
      SetLanguageUseCase(sl<LanguageRepo>()));

  // Bloc
  sl.registerFactory<LanguageBloc>(
      () => LanguageBloc(sl<GetLanguageUseCase>(), sl<SetLanguageUseCase>()));
}
