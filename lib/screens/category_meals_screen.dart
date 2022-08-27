// ignore_for_file: prefer_const_constructors, invalid_required_positional_param, use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';

import '../models/meals_model.dart';
import '../widgets/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category meals';
  const CategoryMealsScreen(
    @required this.availableMeals,
  );
  final List<Meals> availableMeals;
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  late List<Meals> displayedMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories!.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: displayedMeals[index].id!,
            title: displayedMeals[index].title!,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration!,
            complexity: displayedMeals[index].complexity!,
            affordability: displayedMeals[index].affordability!,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
