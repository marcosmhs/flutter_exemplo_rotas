import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> meals;

  // ignore: use_key_in_widget_constructors
  const FavoriteScreen({required this.meals});

  @override
  Widget build(BuildContext context) {
    List<Meal> favoriteMeals = meals.where((meal) {
      return meal.favorite == true;
    }).toList();

    return Center(
      child: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: ((ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        }),
      ),
    );
  }
}
