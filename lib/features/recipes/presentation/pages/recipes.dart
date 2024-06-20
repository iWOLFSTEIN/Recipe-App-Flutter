import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:recipes_app/config/router/app_router.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/features/recipes/domain/entities/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/recipes/recipes_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/loading_error_info.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  late final ThemeBloc themeBloc = context.watch<ThemeBloc>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppRouter.navigationStack.pop(context, currentId: AppRouter.recipes.id);
        return true;
      },
      child: Scaffold(
        body: SafeArea(child: BlocBuilder<RecipesBloc, RecipesState>(
          builder: (context, state) {
            if (state is RecipesLoading) {
              return const CustomLoadingWidget();
            } else if (state is RecipesException) {
              return CustomErrorWidget(
                message: state.exception.toString(),
              );
            }

            final List recipes = state.response!.recipes!;

            if (recipes.isEmpty) return const CustomInfoWidget();

            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.gap16Px,
                  vertical: AppConstants.gap20Px),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeItem(
                    recipe: recipes[index],
                    themeBloc: themeBloc,
                    isLastItem: index != recipes.length - 1);
              },
            );
          },
        )),
      ),
    );
  }
}

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.themeBloc,
    required this.isLastItem,
    required this.recipe,
  });

  final RecipeEntity recipe;
  final ThemeBloc themeBloc;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    final String coverImage = recipe.image ?? '',
        name = recipe.name ?? '',
        difficulty = recipe.difficulty ?? '',
        cuisine = recipe.cuisine ?? '';
    final double rating = recipe.rating ?? 0.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: themeBloc.baseTheme.border),
              color: themeBloc.baseTheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.gap6Px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: themeBloc.baseTheme.border)),
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Image.network(
                          coverImage,
                          height: 350,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: SizedBox(
                                  width: 100,
                                  height: 2,
                                  child: LinearProgressIndicator(
                                    value: (loadingProgress
                                            .cumulativeBytesLoaded) /
                                        (loadingProgress.expectedTotalBytes ??
                                            1.0),
                                  )),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                  child: Icon(
                            Icons.broken_image,
                            size: 24,
                          )),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppConstants.gap8Px),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppConstants.gap12Px,
                                      vertical: AppConstants.gap4Px),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      color: themeBloc.baseTheme.identity
                                          .withOpacity(0.7)),
                                  child: Text(
                                    difficulty,
                                    style: TextStyle(
                                        color: themeBloc.baseTheme.primaryText),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Gap(AppConstants.gap8Px),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.gap6Px),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: themeBloc.baseTheme.primaryText,
                                fontSize: AppConstants.font16Px,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            cuisine,
                            style: TextStyle(
                                color: themeBloc.baseTheme.secondaryText,
                                fontSize: AppConstants.font12Px,
                                fontWeight: FontWeight.w600),
                          ),
                          const Gap(AppConstants.gap6Px),
                        ],
                      ),
                      const Spacer(),
                      RatingBar(
                        rating: rating,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (isLastItem)
          const SizedBox(
            height: AppConstants.gap16Px,
          )
      ],
    );
  }
}

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    final double ratingTruncated = rating.truncateToDouble();
    bool isRatingFractional = ratingTruncated != rating;
    return Row(
      children: [
        for (double count = 1; count <= 5; count++)
          buildRatingIcon(count, ratingTruncated, isRatingFractional, themeBloc)
      ],
    );
  }

  Icon buildRatingIcon(
      count, ratingTruncated, isRatingFractional, ThemeBloc themeBloc) {
    if (rating == 0.0) {
      return const Icon(
        Icons.star_border,
        size: 16,
      );
    }

    bool isFilled = count <= ratingTruncated;
    bool isHalfFilled = isRatingFractional && (ratingTruncated + 1) == count;
    if (isHalfFilled) {
      return const Icon(
        Icons.star_half,
        size: 16,
        color: Colors.yellow,
      );
    }

    return Icon(
      isFilled ? Icons.star : Icons.star_border,
      size: 16,
      color: isFilled ? Colors.yellow : themeBloc.baseTheme.icon,
    );
  }
}
