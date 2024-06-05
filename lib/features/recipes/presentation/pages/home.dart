import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/constants/app_assets.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/bloc/theme/theme_bloc.dart';
import 'package:recipes_app/features/recipes/presentation/pages/explore.dart';
import 'package:recipes_app/features/recipes/presentation/pages/recipes.dart';
import 'package:recipes_app/features/recipes/presentation/pages/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ThemeBloc themeBloc = context.read<ThemeBloc>();
  int _selectedPageIndex = 0;

  final List<Widget> _pages = const [Recipes(), Explore(), Settings()];
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
      body: IndexedStack(
        index: _selectedPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedFontSize: AppConstants.font12Px,
        items: _items,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedPageIndex = index;
    setState(() {});
  }
}
