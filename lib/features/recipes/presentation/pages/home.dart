import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants/app_assets.dart';
import 'package:recipes_app/core/constants/app_constants.dart';
import 'package:recipes_app/core/constants/view_constants.dart';
import 'package:recipes_app/features/recipes/presentation/pages/recipes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    const Recipes(),
    Container(
      color: Colors.green,
    )
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.recipes),
        ),
        activeIcon: const ImageIcon(
          AssetImage(AppAssets.recipes),
        ),
        label: ViewConstants.recipes.tr()),
    BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.search),
        ),
        activeIcon: const ImageIcon(
          AssetImage(AppAssets.search),
        ),
        label: ViewConstants.explore.tr())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
