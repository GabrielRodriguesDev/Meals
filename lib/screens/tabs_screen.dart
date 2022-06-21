// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //* DefaultTabController -> Controlador de abas que sincroniza a aba seleciona (TabBar) com o conteudo visual (TabBarView)
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar?'),
          bottom: TabBar(tabs: [
            // * TabBar -> Seleção elemento que será selecionado para notificar o controlador que precisa mudar a visualização
            Tab(
              icon: Icon(Icons.category),
              text: 'Categorias',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorito',
            ),
          ]),
        ),
        body: TabBarView(children: [
          // * TabBarView -> Conteudo a ser exibido de acordo com a TabBar selecionada (lembrando que é tudo por ordenação, então se atentar ordem que definimos a TabBar e TabView)
          CategoriesScreen(),
          FavoriteScreen(),
        ]),
      ),
    );
  }
}
