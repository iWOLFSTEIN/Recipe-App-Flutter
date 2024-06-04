import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      backgroundColor: themeBloc.baseTheme.background,
      appBar: AppBar(
        actions: const [ThemeButton()],
      ),
      body: SafeArea(
          child: ListView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.gap16Px, vertical: AppConstants.gap20Px),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: themeBloc.baseTheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
              ),
              if (index != items.length - 1)
                const SizedBox(
                  height: AppConstants.gap16Px,
                )
            ],
          );
        },
      )),
    );
  }
}

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.watch<ThemeBloc>();
    final bool isLightTheme = themeBloc.state is LightThemeState;
    final icon = isLightTheme ? Icons.light_mode : Icons.dark_mode;
    return GestureDetector(
        onTap: () {
          if (isLightTheme) {
            themeBloc.add(DarkThemeEvent());
            return;
          }
          themeBloc.add(LightThemeEvent());
        },
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.gap16Px),
          child: Icon(icon),
        ));
  }
}
