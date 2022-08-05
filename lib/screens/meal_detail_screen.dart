import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) setFavoriteMeal;

  // ignore: use_key_in_widget_constructors
  const MealDetailScreen({required this.setFavoriteMeal});

  @override
  Widget build(BuildContext context) {
    // dados recebidos na chamada da tela.
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    Container _sectionTitle(BuildContext context, String title) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      );
    }

    Container _sectionDetail(Widget child) {
      return Container(
        width: 400,
        height: 260,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(1),
        ),
        child: child,
      );
    }

    Container _ingredientsList(Meal meal, BuildContext context) {
      return _sectionDetail(
        ListView.builder(
          itemCount: meal.ingredients.length,
          itemBuilder: (ctx, index) {
            return Card(
              color: Theme.of(context).colorScheme.onSecondary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(meal.ingredients[index]),
              ),
            );
          },
        ),
      );
    }

    Container _stepsList(Meal meal, BuildContext context) {
      return _sectionDetail(
        ListView.builder(
          itemCount: meal.steps.length,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                ListTile(
                  // circulo com o número do passo
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text('${index + 1}'),
                  ),
                  // texto
                  title: Text(
                    meal.steps[index],
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _sectionTitle(context, "Ingredientes"),
            // lista dos ingredientes
            _ingredientsList(meal, context),
            // passos - título
            _sectionTitle(context, "Método de preparo"),
            // passos - lista
            _stepsList(meal, context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // método pop retira a tela da lista e permite a passagem
          // de um parâmetro do tipo object, que pode ser qqr coisa
          // do id da refeição ao objeto inteiro.
          meal.favorite = !meal.favorite;
          setFavoriteMeal(meal);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(meal.favorite ? Icons.star : Icons.star_border_outlined),
      ),
    );
  }
}
