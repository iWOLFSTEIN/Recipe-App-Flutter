import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/recipes_tags/recipes_tags_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/loading_error_info.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/translated_text.dart';

class SelectRecipesTagBottomSheet extends StatelessWidget {
  const SelectRecipesTagBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: themeBloc.baseTheme.border.withOpacity(0.2)),
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: BlocBuilder<RecipesTagsBloc, RecipesTagsState>(
        builder: (context, state) {
          if (state is RecipesTagsLoading) {
            return const CustomLoadingWidget();
          } else if (state is RecipesTagsException) {
            return CustomErrorWidget(
              message: state.exception.toString(),
            );
          }

          final recipesTags = state.response?.tags;
          if (recipesTags == null) return const CustomInfoWidget();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppConstants.gap16Px),
                child: TranslatedText(
                  ViewConstants.selectRecipesTag,
                  style: TextStyle(
                      color: themeBloc.baseTheme.primaryText,
                      fontSize: AppConstants.font18Px,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(
                          left: AppConstants.gap14Px,
                          right: AppConstants.gap14Px,
                          bottom: AppConstants.gap16Px),
                      itemCount: recipesTags.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.gap16Px,
                                    vertical: AppConstants.gap16Px),
                                decoration: BoxDecoration(
                                    color: themeBloc.baseTheme.surface
                                        .withOpacity(0.4),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Text(
                                      recipesTags[index],
                                      style: TextStyle(
                                          color:
                                              themeBloc.baseTheme.primaryText,
                                          fontSize: AppConstants.font16Px),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: themeBloc.baseTheme.primaryText,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            if (index < recipesTags.length - 1)
                              const Gap(AppConstants.gap8Px)
                          ],
                        );
                      })),
            ],
          );
        },
      ),
    );
  }
}
