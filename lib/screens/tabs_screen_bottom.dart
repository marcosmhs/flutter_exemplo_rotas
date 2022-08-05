import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabScreenBottom extends StatefulWidget {
  final List<Meal> meals;

  // ignore: use_key_in_widget_constructors
  const TabScreenBottom({required this.meals});

  @override
  State<TabScreenBottom> createState() => _TabScreenBottomState();
}

class _TabScreenBottomState extends State<TabScreenBottom> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Categorias',
        'screen': const CategoriesScreen()
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(meals: widget.meals)
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _screens[_selectedScreenIndex]['title'] as String,
          ),
        ),
        // menu na barra de título
        drawer: const Drawer(
          child: MainDrawer(),
        ),
        // função irá retornar a tela ativda. Como este é um form statefull, quando o setstate
        // for chamado a alteração será replicada para toda a tela.
        body: _screens[_selectedScreenIndex]['screen'] as Widget,
        // barra inferior
        bottomNavigationBar: BottomNavigationBar(
          // cor do item selecionado
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          // cor do item não selecionado
          unselectedItemColor: Colors.white,
          // função que deve ser executada sempre que o usuário tocar em algum item
          // importante lembrar que ontap retorna um value, neste caso o index e a função
          // selectScreen recebe um parâmetro com o mesmo tipo (int)
          onTap: _selectScreen,
          // cria uma animação na troca das telas, por conta disso a propriedade backgroundColor
          // deve ser colocada em cada um dos itens.
          // Quando usar a opção BottomNavigationBarType.fixed a propriedade backgroundColor deve ficar no pai.
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              // cor da barra igual à cor do tema
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              // cor da barra igual à cor do tema
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
