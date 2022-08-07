// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal detail';
  final dynamic toggleFavorite;
  final dynamic isFavorite;
  const MealDetailScreen(
    this.toggleFavorite,
    this.isFavorite,
  );

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = Dummy_Meals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(SectionTitle: 'Ingredients'),
            _buildContainer(
              context: context,
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _buildSectionTitle(SectionTitle: "Steps"),
            _buildContainer(
              context: context,
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.favorite : Icons.heart_broken,
        ),
      ),
    );
  }

  Container _buildSectionTitle({required String SectionTitle}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        SectionTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Container _buildContainer(
    {required BuildContext context, required Widget child}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 200,
    width: MediaQuery.of(context).size.width * 0.6,
    child: child,
  );
}
