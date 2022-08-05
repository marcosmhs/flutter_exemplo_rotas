import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      // cria uma margem em forma de toda a grid para evitar que os itens fiquem grudados na tela
      padding: const EdgeInsets.all(5),
      // SliverGridDelegateWithMaxCrossAxisExtent indica como a Grid será
      // renderizada, neste caso com o crossAxis (horizontal) considerando
      // toda a área da tela
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // cada elemento terá no máximo 200px na linha
        maxCrossAxisExtent: 200,
        // proporção de 3 para 2 itens
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map((c) {
        return CategoryItem(category: c);
      }).toList(),
    );
  }
}
