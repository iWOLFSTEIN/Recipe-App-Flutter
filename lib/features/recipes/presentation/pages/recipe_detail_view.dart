import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/custom_network_image.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/translated_text.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key, required this.recipe});

  final RecipeEntity recipe;

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();

    String image = recipe.image ?? '';
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.gap10Px, vertical: AppConstants.gap10Px),
          children: [
            CustomNetworkImage(coverImage: image),
            const Gap(AppConstants.gap16Px),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppConstants.gap16Px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recipe name',
                    style: TextStyle(
                        color: themeBloc.baseTheme.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const Gap(AppConstants.gap8Px),
                  TranslatedText(
                    ViewConstants.ingredients,
                    style: TextStyle(
                        color: themeBloc.baseTheme.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
