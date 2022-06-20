import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

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
      body: Center(child: Text(meal.title)),
    );
  }
}
