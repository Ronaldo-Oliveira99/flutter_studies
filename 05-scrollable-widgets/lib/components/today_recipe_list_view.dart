import 'package:flutter/material.dart';

/* 1 Importe os arquivos de barrel, component.dart e models.dart, para que você possa 
usar dados modelos e componentes de UI. */
import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  // 2 TodayRecipeListView precisa de uma lista de receitas para exibir.
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3 Em build(), comece aplicando algum preenchimento.
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),

      // 4 Adicione uma Coluna para colocar os widgets em um layout vertical.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // 5 Na coluna, adicione um Texto. Este é o cabeçalho das Receitas do Dia
          Text('Recipes of the Day " ',
              style: Theme.of(context).textTheme.headline1),

          // 6 Adicione um SizedBox de 16 pontos de altura, para fornecer algum preenchimento.
          const SizedBox(height: 16),

          /* 7 Adicione um Container, com 400 pixels de altura, e defina a cor de fundo 
            para cinza. este container manterá sua visualização de lista horizontal. */
          Container(
            height: 400,

            // TODO: Add ListView Here
            // 1.2 Altere a cor de cinza para transparente.
            color: Colors.transparent,

            // 2.2 Crie ListView.separated. Lembre-se, este widget cria dois IndexedWidgetBuilders.
            child: ListView.separated(

              // 3.2 Defina a direção de rolagem para o eixo horizontal.
              scrollDirection: Axis.horizontal,

              // 4.2 Defina o número de itens na exibição de lista.
              itemCount: recipes.length,

              // 5.2 Crie o retorno de chamada itemBuilder, que passará por todos os itens da lista.
              itemBuilder: (context, index) {

                // 6.2 Obtenha a receita para o índice atual e construa o cartão.
                final recipe = recipes[index];

                return buildCard(recipe);
              },
              // 7.2 Crie o retorno de chamada separatorBuilder, que passará por todos os itens da Lista.
              separatorBuilder: (context, index) {

                // 8.2 Para cada item, você cria uma SizedBox para espaçar cada item com 16 pontos de distância
                return const SizedBox(width: 16);
              },
            ),
          ),
        ],
      ),
    );
  }

  // TODO: Add buildCard() widget here
  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
