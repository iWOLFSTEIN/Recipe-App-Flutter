import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants/view_constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    )
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.restaurant), label: ViewConstants.recipes.tr()),
    BottomNavigationBarItem(
        icon: const Icon(Icons.search), label: ViewConstants.explore.tr())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
