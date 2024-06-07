import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
    AppRouter.navigationStack.add(previousIndex);
    final int? poppedIndex = await context.push(_routes[_selectedPageIndex]!);
    if (AppRouter.navigationStack.isEmpty || poppedIndex == null) return;
    _selectedPageIndex = AppRouter.navigationStack.removeLast();
    setState(() {});
  }
}
