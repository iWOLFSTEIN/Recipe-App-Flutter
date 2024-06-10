import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/app_router.dart';
import 'package:recipes_app/core/constants/app_assets.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/custom_field.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.read<ThemeBloc>();
    return WillPopScope(
      onWillPop: () async {
        // AppRouter.navigationStack.removeLast();
        // context.pop(AppRouter.explore.id);
        AppRouter.navigationStack.pop(context, currentId: AppRouter.explore.id);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.gap16Px, vertical: AppConstants.gap24Px),
          children: [
            CustomField(
              hintText: ViewConstants.search,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(AppConstants.gap16Px),
                child: ImageIcon(
                  const AssetImage(AppAssets.search),
                  color: themeBloc.baseTheme.contrast,
                  size: 20,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
