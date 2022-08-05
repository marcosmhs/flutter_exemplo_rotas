import 'package:flutter/material.dart';
import 'package:navegacao_telas/utils/app_routes.dart';
import 'package:navegacao_telas/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      // nome da rota definida em routes no main.dart
      AppRoutes.categoriesMeals,
      // passagem de parâmetros, ele será recebido na tela destino via
      // ModalRoute.of(context)?.settings.arguments as Category
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    // inkwell possui método para capturar clique (onTap)
    return InkWell(
      // feito para que o inkwell tenha a mesma borda do container
      borderRadius: BorderRadius.circular(5),
      // adiciona um efeito de cor no local onde a pessoa toca no quadro.
      splashColor: Theme.of(context).primaryColor,
      onTap: () => _selectCategory(context),
      child: Container(
        decoration: BoxDecoration(
          // cria cantos levemente arredondados
          borderRadius: BorderRadius.circular(5),
          // cria o gradiente com base na cor da categoria
          gradient: LinearGradient(
            colors: [
              // primeira cor é a cor da categoria com 70% de transparência
              category.color.withOpacity(0.3),
              // segunda cor também é a cor da categoria mas com apenas 10% de transparência
              category.color.withOpacity(0.9),
            ],
            // orientação do gradiente
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // Cria uma magem interna de 10px para evitar que tudo fique grudado nas
        // bordas
        padding: const EdgeInsets.all(10),
        child: Text(
          category.title,
          // formata a  fonte de acordo com propriedades do tema.
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
