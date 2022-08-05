import 'package:flutter/material.dart';
import 'package:navegacao_telas/components/meal_item.dart';
import 'package:navegacao_telas/models/category.dart';
import 'package:navegacao_telas/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // utilizado para envio de parâmetros em telas abertas à partir de rotas
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    // retorna todas as refeições da categoria base
    final categoryMeals = dummyMeals.where((meal) {
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
