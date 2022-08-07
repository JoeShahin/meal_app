// ignore_for_file: prefer_const_constructors, unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../models/meals_model.dart';
import '../widgets/meals_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meals> _favoriteMeals;
  const FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text("You haven't favorites yet - Start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: _favoriteMeals[index].id!,
            title: _favoriteMeals[index].title!,
            imageUrl: _favoriteMeals[index].imageUrl,
            duration: _favoriteMeals[index].duration!,
            complexity: _favoriteMeals[index].complexity!,
            affordability: _favoriteMeals[index].affordability!,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
