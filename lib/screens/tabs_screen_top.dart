import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabScreenTop extends StatelessWidget {
  final List<Meal> meals;

  // ignore: use_key_in_widget_constructors
  const TabScreenTop({required this.meals});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // quantidade de abas
      length: 2,
      // aba padrão (apenas para exemplo, por padrão é preenchida com 0)
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Vamos Cozinhar?"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categorias'),
              Tab(icon: Icon(Icons.favorite), text: 'Favoritos')
            ],
          ),
        ),
        // TabBarView deve ser preenchido com a tela nas mesmas posições da TabBat
        body: TabBarView(
          children: [
            const CategoriesScreen(),
            FavoriteScreen(meals: meals)
          ],
        ),
      ),
    );
  }
}
