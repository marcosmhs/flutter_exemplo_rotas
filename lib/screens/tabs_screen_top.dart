import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabScreenTop extends StatelessWidget {
  const TabScreenTop({Key? key}) : super(key: key);

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
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen()
          ],
        ),
      ),
    );
  }
}
