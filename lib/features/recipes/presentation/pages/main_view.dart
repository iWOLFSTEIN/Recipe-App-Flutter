import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:recipes_app/config/router/app_router.dart';
import 'package:recipes_app/core/constants/app_assets.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/widgets/translated_text.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.child});

  final Widget child;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final ThemeBloc themeBloc = context.read<ThemeBloc>();

  int _selectedPageIndex = 0;

  final Map<int, String> _routes = {
    0: AppRouter.recipes.path,
    1: AppRouter.explore.path,
    2: AppRouter.settings.path
  };

  final List<String> labels = [
    ViewConstants.recipes,
    ViewConstants.explore,
    ViewConstants.settings
  ];

  late final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.recipes),
        ),
        label: labels[0].tr()),
    BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.search),
        ),
        label: labels[1].tr()),
    BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.settings),
        ),
        label: labels[2].tr())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslatedText(
          labels[_selectedPageIndex],
        ),
        actions: [if (_selectedPageIndex == 0) const RecipesTagsButton()],
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedFontSize: AppConstants.font12Px,
        items: _items,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    final int previousIndex = _selectedPageIndex;
    _selectedPageIndex = index;
    setState(() {});
    _navigateToPage(previousIndex, index);
  }

  void _navigateToPage(int previousIndex, int index) async {
    if (previousIndex == index) return;

    _selectedPageIndex = await AppRouter.navigationStack.push(context,
            destinationPath: _routes[_selectedPageIndex]!,
            currentId: previousIndex,
            destinationId: index) ??
        0;
    setState(() {});
  }
}

class RecipesTagsButton extends StatefulWidget {
  const RecipesTagsButton({
    super.key,
  });

  @override
  State<RecipesTagsButton> createState() => _RecipesTagsButtonState();
}

class _RecipesTagsButtonState extends State<RecipesTagsButton> {
  double rotation = 0;
  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Padding(
      padding: const EdgeInsets.only(
          top: AppConstants.gap10Px, right: AppConstants.gap16Px),
      child: GestureDetector(
        onTap: () {
          rotation = rotation == 0 ? pi : 0;
          setState(() {});
        },
        child: Row(
          children: [
            TranslatedText(
              ViewConstants.tags,
              style: TextStyle(
                  color: themeBloc.baseTheme.primary,
                  fontSize: AppConstants.font14Px),
            ),
            const Gap(AppConstants.gap4Px),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: rotation),
              duration: const Duration(milliseconds: 200),
              builder: (context, value, child) => Transform.rotate(
                angle: value,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: themeBloc.baseTheme.icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
