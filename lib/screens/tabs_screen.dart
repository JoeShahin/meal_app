// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_field

import 'package:flutter/material.dart';

import '../models/meals_model.dart';
import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meals> _favoriteMeals;
  TabsScreen(this._favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget._favoriteMeals),
        'title': 'Your Favorite',
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.indigo,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
