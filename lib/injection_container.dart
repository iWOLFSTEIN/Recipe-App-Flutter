import 'package:get_it/get_it.dart';
import 'package:recipes_app/features/recipes/data/datasource/local/theme_store.dart';
import 'package:recipes_app/features/recipes/data/managers/local/local_storage.dart';
import 'package:recipes_app/features/recipes/data/managers/local/shared_preference.dart';
import 'package:recipes_app/features/recipes/data/repositories/theme.dart';
import 'package:recipes_app/features/recipes/domain/repositories/theme.dart';
import 'package:recipes_app/features/recipes/domain/usecases/theme/get_theme.dart';
import 'package:recipes_app/features/recipes/domain/usecases/theme/set_theme.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register Dependencies
  sl.registerSingleton<LocalStorageManager>(
      SharedPreferenceManager(sl<SharedPreferences>()));
  sl.registerSingleton<ThemeStore>(ThemeStore(sl<LocalStorageManager>()));
  sl.registerSingleton<ThemeRepo>(ThemeRepoImpl(sl<ThemeStore>()));

  // UseCases
  sl.registerSingleton<GetThemeUseCase>(GetThemeUseCase(sl<ThemeRepo>()));
  sl.registerSingleton<SetThemeUseCase>(SetThemeUseCase(sl<ThemeRepo>()));

  // Bloc
  sl.registerFactory<ThemeBloc>(
      () => ThemeBloc(sl<GetThemeUseCase>(), sl<SetThemeUseCase>()));
}
