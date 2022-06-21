// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _creaeSectionContainer(Widget child) {
    return Container(
        width: 300,
        height: 290,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)
            ?.settings
            .arguments // ! ModalRoute.of(context) usamos o contexto pois o ModalRef é uma função do Material/CupertinoApp -> Ela pega os argumentos passados para a rota (caso não seja passado nenhum retorna null)
        as Meal; //! Pegando o parametro que foi passado como argumento
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Refeição'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit
                  .cover, // * Ajustando a imagem dentro de uma caixa (BoxFit). cover => cobrir, portanto estamos cobrindo o container com a imagem. (BoxFit -> Caixa Ajustada).
            ),
          ),
          _createSectionTitle(context, 'Ingredientes'),
          _creaeSectionContainer(
            ListView.builder(
              //! Nesse caso do ListView estamos usando o context para recuperar a instância mais próxima de SliverMultiBoxAdaptorElement na árvore acima (classe que o ListView.builder precisa para criar os child preguisosamente.),
              itemCount: meal.ingredients.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                );
              }),
            ),
          ),
          _createSectionTitle(context, 'Passos'),
          _creaeSectionContainer(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          meal.steps[index],
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                }),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
