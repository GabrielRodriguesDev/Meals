import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal}) : super(key: key);

  final Meal meal;
  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.mealDetail, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              // * Widget de pilha, que permite empilhar um widget sobre o outro.
              children: [
                ClipRRect(
                  // * Widget recortador, ele permite "recortar a imagem" como por exemplo aplicar uma borda sobre ela.
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit
                        .cover, // * Deixando a imagem dentro de uma caixa ajustada (não deixa estourar) -> cover = cobrir. Portanto estamos cobrindo o card sem estourar e sim ajustando para dentro da caixa.
                  ),
                ),
                Positioned(
                  // * Widget que permite definir o posionamento de um Widget dentro de uma Stack.
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors
                            .black54 // * Aplicando um preto com 54% de opacidade.
                        ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal:
                            20), // * Aplicando um espaçamento interno do container.
                    child: Text(
                      meal.title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap:
                          true, // * Habilitando a quebra de linha se necessário.
                      overflow: TextOverflow
                          .fade, // * Habilitando o fade (... três pontinhos) caso o texto seja muito grande e queira ultrapassar o widget pai.
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(meal.complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(meal.costText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
