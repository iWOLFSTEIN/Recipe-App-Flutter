import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/config/languages/language_config.dart';
import 'package:recipes_app/config/router/app_router.dart';
import 'package:recipes_app/core/constants/app_assets.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/language/language_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/recipes/recipes_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:recipes_app/injection_container/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  try {
    await EasyLocalization.ensureInitialized();
    runApp(EasyLocalization(
        assetLoader: CsvAssetLoader(),
        path: AppAssets.translations,
        fallbackLocale: LanguageConfig.defaultLanguage.locale,
        supportedLocales: LanguageConfig.locales,
        child: const MainApp()));
  } catch (e) {
    debugPrint(e.toString());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ThemeBloc>(
        create: (_) => sl(),
      ),
      BlocProvider<LanguageBloc>(
        create: (_) => sl(),
      ),
      BlocProvider<RecipesBloc>(
        create: (_) => sl()..add(const GetRecipes()),
      ),
    ], child: const RecipesApp());
  }
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.watch<ThemeBloc>();
    return BlocBuilder<LanguageBloc, LanguageState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          color: themeBloc.baseTheme.primary,
          theme: themeBloc.baseTheme.themeData,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationParser: AppRouter.router.routeInformationParser,
        );
      },
    );
  }
}
