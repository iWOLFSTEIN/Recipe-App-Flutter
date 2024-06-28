import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:recipes_app/config/router/app_router.dart';
import 'package:recipes_app/core/constants/app_assets.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/pages/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/custom_field.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/custom_network_image.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final double searchFieldHeight = 56.0;
  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.read<ThemeBloc>();
    return WillPopScope(
      onWillPop: () async {
        AppRouter.navigationStack.pop(context, currentId: AppRouter.explore.id);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(
                  left: AppConstants.gap16Px,
                  right: AppConstants.gap16Px,
                  top: AppConstants.gap24Px +
                      searchFieldHeight +
                      AppConstants.gap16Px),
              children: [
                for (int i = 0; i < 10; i++) const SearchedRecipeItem(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.gap16Px,
                  vertical: AppConstants.gap24Px),
              child: CustomField(
                hintText: ViewConstants.search,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(AppConstants.gap16Px),
                  child: ImageIcon(
                    const AssetImage(AppAssets.search),
                    color: themeBloc.baseTheme.contrast,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class SearchedRecipeItem extends StatelessWidget {
  const SearchedRecipeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.gap12Px),
      child: Container(
        padding: const EdgeInsets.all(AppConstants.gap8Px),
        decoration: BoxDecoration(
            border: Border.all(color: themeBloc.baseTheme.border),
            color: themeBloc.baseTheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomNetworkImage(
              coverImage:
                  'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              height: 110,
              width: 110,
            ),
            const Gap(AppConstants.font8Px),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppConstants.gap16Px),
                    child: Text(
                      "Classic Margherita",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: themeBloc.baseTheme.primaryText,
                          fontSize: AppConstants.font16Px,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    'Italian',
                    style: TextStyle(
                        color: themeBloc.baseTheme.secondaryText,
                        fontSize: AppConstants.font12Px,
                        fontWeight: FontWeight.w600),
                  ),
                  const Gap(AppConstants.gap8Px),
                  const RatingBar(
                    rating: 4.1,
                    reviewCount: 16,
                  ),
                  const Gap(AppConstants.gap8Px),
                  tags(themeBloc)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Wrap tags(ThemeBloc themeBloc) {
    final recipeTags = ["Pizza", "Italian"];
    return Wrap(
      spacing: AppConstants.gap4Px,
      children: recipeTags
          .map((tag) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.gap12Px,
                        vertical: AppConstants.gap6Px),
                    decoration: BoxDecoration(
                        color: themeBloc.baseTheme.identity,
                        border: Border.all(color: themeBloc.baseTheme.border),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      tag,
                      style: TextStyle(
                          color: themeBloc.baseTheme.primaryText,
                          fontSize: AppConstants.font12Px),
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }
}
