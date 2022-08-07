// ignore_for_file: sort_child_properties_last, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItems(this.title, this.color, this.id);
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'title': title,
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
