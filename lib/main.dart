import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/assets.dart';
import 'package:recipes_app/features/recipes/presentation/pages/home.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await EasyLocalization.ensureInitialized();
    runApp(EasyLocalization(
        assetLoader: CsvAssetLoader(),
        path: Assets.translations,
        fallbackLocale: AppConstants.en,
        supportedLocales: const [
          AppConstants.en,
          AppConstants.ur,
          AppConstants.hi
        ],
        child: const MainApp()));
  } catch (e) {
    print('Error initializing EasyLocalization: $e');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const Home(),
    );
  }
}
