import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.watch<ThemeBloc>();
    bool isLightTheme = themeBloc.themeType == ThemeType.light;
    final icon = isLightTheme ? Icons.light_mode : Icons.dark_mode;
    return GestureDetector(
        onTap: () {
          if (isLightTheme) {
            themeBloc.add(DarkThemeEvent());
          } else {
            themeBloc.add(LightThemeEvent());
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.gap16Px),
          child: Icon(
            icon,
          ),
        ));
  }
}
