import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

//Criando as receitas GridView
class RecipesGridView extends StatelessWidget {

  // 1 RecipesGridView requer uma lista de receitas para exibir em uma grade
  final List<SimpleRecipe> recipes;

  const RecipesGridView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {

     // 2 Aplique um preenchimento de 16 pixels à esquerda, direita e superior.
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),

      // 3 Crie um GridView.builder, que exibe apenas os itens visíveis na tela.
      child: GridView.builder(

         // 4 Diga à visualização em grade quantos itens estarão na grade.
        itemCount: recipes.length,

         /* 5 Adicione SliverGridDelegateWithFixedCrossAxisCount e defina 
        crossAxisCount como 2. Isso significa que haverá apenas duas colunas. */
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {

          // 6 Para cada índice, busque a receita e crie uma RecipeThumbnail correspondente.
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: simpleRecipe);
        },
      ),
    );
  }
}
