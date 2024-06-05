import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/theme_button.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  late final ThemeBloc themeBloc = context.read<ThemeBloc>();
  final items = [for (int i = 0; i < 10; i++) 'item'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: themeBloc.baseTheme.surface,
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
