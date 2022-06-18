import 'package:flutter/material.dart';
import 'package:meals/components/category_item.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vamos cozinhar! "),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(
            15), // * Preenchimento dos filhos que são todos os CategoryItem (ou seja vai tirar eles da ponta da dela)
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //! Grid Delegate é responsável pelo controle dos filhos da Grid
          //! SliverGridDelegateWithMaxCrossAxisExtent -> Cria um layout com blocos que têm uma extensão máxima de eixo cruzado.
          maxCrossAxisExtent:
              200, // * A extensão máxima dos blocos no eixo cruzado. (Da direita para a esquerda (O padrão de rolagem é vertical então o cross é horizontal))
          childAspectRatio: 3 /
              2, // * A razão entre o eixo cruzado e a extensão do eixo principal de cada filho.
          crossAxisSpacing: 20, // * Espaço entre as colunas
          mainAxisSpacing: 20, // * Espaço entre as linhas
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(category: cat);
        }).toList(),
      ),
    );
  }
}
