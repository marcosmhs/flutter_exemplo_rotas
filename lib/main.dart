import 'package:flutter/material.dart';
import 'package:navegacao_telas/models/settings.dart';
import 'package:navegacao_telas/my_theme.dart';
import 'package:navegacao_telas/screens/meal_detail_screen.dart';
import 'package:navegacao_telas/screens/screen_not_found.dart';
import 'package:navegacao_telas/screens/settings_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/tabs_screen_bottom.dart';
import 'utils/app_routes.dart';

import 'models/meal.dart';
import 'dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // base das refeições para toda aplicação
  List<Meal> _avaliableMeals = dummyMeals;

  Settings mainSettings = Settings();

  void _applyMealsFilter(Settings settings) {
    setState(() {
      // sempre que uma configuração for alterada as configurações são atualizadas
      // no objeto que quarda os dados para toda a aplicação
      mainSettings = settings;

      // filtro de refeições
      _avaliableMeals = dummyMeals.where((meal) {
        final filterGlutenFree = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactoseFree = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGlutenFree && !filterLactoseFree && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  void _setFavoriteMeal(Meal meal) {
    setState(() {
      // altera a indicação se é ou não favorito
      _avaliableMeals.singleWhere((element) => element == meal).favorite = meal.favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar',
      // definição do tema padrão
      theme: MyTheme.myTheme,
      // rotas de telas
      routes: {
        AppRoutes.home: (ctx) => TabScreenBottom(meals: _avaliableMeals),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsScreen(meals: _avaliableMeals),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(setFavoriteMeal: _setFavoriteMeal),
        AppRoutes.settings: (ctx) => SettingsScreen(mainSettings: mainSettings, onSettingsChange: _applyMealsFilter)
      },
      // indica qual a rota da tela inicial
      initialRoute: AppRoutes.home,
      // Executado quando uma tela não é encontrada
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return ScreenNotFound(settings.name.toString());
        });
      },
    );
  }
}
