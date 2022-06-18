// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        // canvasColor: Color.fromRGBO(255, 254, 229,
        //    1), // * Trocando cor de fundo de branco para amarelado,
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          titleMedium: TextStyle(
              // * Definição de um texto de tema
              fontSize: 20,
              fontFamily: 'RobotoCondesed',
              fontWeight: FontWeight.w700),
        ),
      ),
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen()
      },
    );
  }
}
