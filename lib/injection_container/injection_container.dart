import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes_app/features/recipes/data/managers/local/local_storage.dart';
import 'package:recipes_app/features/recipes/data/managers/local/shared_preference.dart';
import 'package:recipes_app/features/recipes/data/managers/remote/api_manager.dart';
import 'package:recipes_app/features/recipes/data/managers/remote/dio_api_manager.dart';
import 'package:recipes_app/injection_container/dependencies/language_injection.dart';
import 'package:recipes_app/injection_container/dependencies/recipes_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependencies/theme_injection.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  sl.registerSingleton<LocalStorageManager>(
      SharedPreferenceManager(sl<SharedPreferences>()));
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ApiManager>(DioApiManager(sl<Dio>()));

  // Dependencies
  initializeThemeDependencies();
  initializeLanguageDependencies();
  initializeRecipesDependencies();
}
