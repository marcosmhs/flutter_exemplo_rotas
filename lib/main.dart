import 'package:flutter/material.dart';
import 'package:navegacao_telas/my_theme.dart';
import 'package:navegacao_telas/screens/meal_detail_screen.dart';
import 'package:navegacao_telas/screens/screen_not_found.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/tabs_screen_bottom.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar',
      // definição do tema padrão
      theme: MyTheme.myTheme,
      // rotas de telas
      routes: {
        AppRoutes.home: (ctx) => const TabScreenBottom(),
        AppRoutes.categoriesMeals: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen()
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
