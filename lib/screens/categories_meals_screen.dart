// ignore_for_file: iterable_contains_unrelated_type, unused_local_variable
import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments
        as Category; //! Pegando o parametro que foi passado como argumento
    // ! ModalRoute.of(context) usamos o contexto pois o ModalRef é uma função do Material/CupertinoApp
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          // ! Listas usam o sliver para serem construidas
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) => MealItem(
              meal: categoryMeals[
                  index]) //! Nesse caso estamos usando o context para recuperar a instância mais próxima de SliverMultiBoxAdaptorElement na árvore acima (classe que o ListView.builder precisa para criar os child preguisosamente.),
          ),
    );
  }
}
