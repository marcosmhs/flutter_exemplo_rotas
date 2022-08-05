import 'package:flutter/material.dart';
import 'package:navegacao_telas/models/meal.dart';
import 'package:navegacao_telas/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.mealDetail,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 2,
        // espaço entre os cards
        margin: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            // permite colocar componetnes um sobre os outros
            Stack(
              children: <Widget>[
                // define bordar para um componente, neste caso a imagem
                // neste caso vamos colocar a borda cicular apenas na parte de cima
                // na parte de baixo elas devem ficar retas
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // texto colocado sobre a imagem, daí a importância do componente Stak
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      meal.title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      // quebra de linha
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(meal.complexityToText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(meal.costToText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
