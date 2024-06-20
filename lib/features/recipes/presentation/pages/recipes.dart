import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
            return RecipeItem(
                themeBloc: themeBloc, isLastItem: index != items.length - 1);
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
  });

  final ThemeBloc themeBloc;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
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
                          'https://cdn.dummyjson.com/recipe-images/1.webp',
                          height: 350,
                          fit: BoxFit.cover,
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
                                    'Easy',
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
                            'Recipe name',
                            style: TextStyle(
                                color: themeBloc.baseTheme.primaryText,
                                fontSize: AppConstants.font16Px,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Recipe name',
                            style: TextStyle(
                                color: themeBloc.baseTheme.secondaryText,
                                fontSize: AppConstants.font12Px,
                                fontWeight: FontWeight.w600),
                          ),
                          const Gap(AppConstants.gap6Px),
                        ],
                      ),
                      const Spacer(),
                      const RatingBar(
                        rating: 3.6,
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
