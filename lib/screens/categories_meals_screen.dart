import 'package:flutter/material.dart';
import 'package:navegacao_telas/components/meal_item.dart';
import 'package:navegacao_telas/models/category.dart';
import 'package:navegacao_telas/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  // ignore: use_key_in_widget_constructors
  const CategoriesMealsScreen({required this.meals});

  @override
  Widget build(BuildContext context) {
    // utilizado para envio de parâmetros em telas abertas à partir de rotas
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    // retorna todas as refeições da categoria base
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: ((ctx, index) {
            return MealItem(meal: categoryMeals[index]);
          }),
        ),
      ),
    );
  }
}
