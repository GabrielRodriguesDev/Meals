// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectdScreenIndex = 0;

  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoriteScreen(),
  ];

  final List<String> _title = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectdScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title[_selectdScreenIndex],
        ),
        centerTitle: true,
      ),
      body: _screens[
          _selectdScreenIndex], // * Array de Widgets, onde a exibição é controlada por um array de Widget onde o indice passado é uma variavel que é controlada por uma função de OnTap que é defininada no BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectScreen, //* Esse método onTap retorna um inteiro que é passado para a função _selectScreen.
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex:
            _selectdScreenIndex, // * Propriedade que serve para o Widget saber qual é o indice selecionado  e poder aplicar o unselectedItemColor e selectedItemColor
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Cagorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
