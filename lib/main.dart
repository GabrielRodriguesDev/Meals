// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
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
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail: (context) => const MealDetailScreen()
      },
      // onGenerateRoute: (settings) {
      //   //! onGenerate Mode é uma função do MaterialApp que permite que possamos definir algum comportamento sobre o app ao tentar acessar alguma rota.
      //   //! Toda vez que tentamos acessar uma rota nomeada esse método é executado então podemos fazer alguma validação de rota, para redirecionar ou coisa do tipo..
      //   //! Lembrando que ele só cai na execução do método caso a rota não tenha sido encontrada nas rotas configuradas.
      //   if (settings.name == '/alguma-coisa') {
      //     // ignore: todo
      // ignore: todo
      //     return null; // TODO -> Retorna outra rota
      //   } else if (settings.name == 'outra coisa') {
      //     // ignore: todo
      // ignore: todo
      //     return null; // TODO -> Retorna outra rota
      //   } else {
      //     return MaterialPageRoute(
      //         builder: (_) =>
      //             const CategoriesScreen()); //!Caso nenhuma rota seja encontrada.
      //   }
      //   //! Sento que o settings representa os metadados da rota que foi chamada
      // },
      onUnknownRoute: (settings) {
        //! Caso as rota especificada não seja encontrada nas configuraçõe de rotas, após isso o flutter chama o método
        //! onGenerateRoute -> caso dentro dele também não tenha nenhuma resolução, esse método e chamado, confirmando que de fato a toda não foi encontrada.
        //! Com iss podemos fazer alguma lógica como redirecionar a tela princial.
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      },
    );
  }
}
