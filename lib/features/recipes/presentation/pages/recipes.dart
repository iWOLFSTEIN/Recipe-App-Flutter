import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/app_router.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  late final ThemeBloc themeBloc = context.watch<ThemeBloc>();
  final items = [for (int i = 0; i < 10; i++) 'item'];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // AppRouter.navigationStack.removeLast();
        // context.pop(AppRouter.recipes.id);
        AppRouter.navigationStack.pop(context, currentId: AppRouter.recipes.id);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.gap16Px, vertical: AppConstants.gap20Px),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: themeBloc.baseTheme.border),
                      color: themeBloc.baseTheme.surface,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                ),
                if (index != items.length - 1)
                  const SizedBox(
                    height: AppConstants.gap16Px,
                  )
              ],
            );
          },
        )),
      ),
    );
  }
}
