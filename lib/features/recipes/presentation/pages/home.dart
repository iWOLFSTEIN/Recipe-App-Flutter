import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/app_router.dart';
import 'package:recipes_app/core/constants/app_assets.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.child});

  final Widget child;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ThemeBloc themeBloc = context.read<ThemeBloc>();
  final List<int> navigatorStack = [];
  int _selectedPageIndex = 0;

  final Map<int, String> _pages = {
    0: AppRouter.recipes.path,
    1: AppRouter.explore.path,
    2: AppRouter.settings.path
  };
  final List<String> labels = [
    ViewConstants.recipes.tr(),
    ViewConstants.explore.tr(),
    ViewConstants.settings.tr()
  ];

  late final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.recipes),
        ),
        label: labels[0]),
    BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.search),
        ),
        label: labels[1]),
    BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.settings),
        ),
        label: labels[2])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
    navigatorStack.add(_selectedPageIndex);

    if (previousIndex == index) return;
    if (index == 0) {
      context.go(_pages[_selectedPageIndex]!);
    } else {
      context.push(_pages[_selectedPageIndex]!);
    }
  }

  void onPop() {
    if (navigatorStack.isEmpty) return;
    _selectedPageIndex = navigatorStack.removeLast();
    print('printing current index');
    setState(() {});
  }
}
