import 'package:flutter/material.dart';

import '../fooderlich_theme.dart';
import '../models/models.dart';

class Card1 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card1({
    super.key,
    required this.recipe,
  });

    /* 1 Defina as variáveis de string a serem exibidas no cartão. Estes são apenas dados de amostra 
       para ajudar a construir o cartão. */
  // final String category = 'Editor\'s Choice';
  // final String title = 'The Art of Dough';
  // final String description = 'Learn to make the perfect bread.';
  // final String chef = 'Ray Wenderlich';

// 2 Todo widget sem estado vem com um método build() que você substitui.
  @override
  Widget build(BuildContext context) {

    // Comece com um Container disposto no centro.
    return Center(
      // TODO: Card1 Decorate Container
      child: Container(

        // TODO: Add a stack of text
        
        /* 1 Aplique um preenchimento de 16 em todos os lados da caixa. As unidades de vibração são especificadas 
          em pixels lógicos, que são como dp no Android. */
        padding: const EdgeInsets.all(16),
        
 // 2 Restrinja o tamanho do contêiner a uma largura de 350 e uma altura de 450.
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),

        // 3 Aplique BoxDecoration. Isso descreve como desenhar uma caixa.
        decoration: BoxDecoration(

          // 4 Em BoxDecoration, configure DecorationImage, que instrui a caixa a pintar uma imagem.
          image: DecorationImage(

             // 5 Defina qual imagem pintar na caixa usando um AssetImage, uma imagem encontrada nos recursos do projeto inicial.
            image: AssetImage(recipe.backgroundImage),

            // 6 Cubra toda a caixa com essa imagem.
            fit: BoxFit.cover,
          ),

           // 7 Aplique um raio de canto de 10 em todos os lados do recipiente.
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            
          /* 8 A categoria, Escolha do Editor, permanece onde está. Lembre-se, Container 
                 já aplica um preenchimento de 16 em todos os lados. */
            Text(
              recipe.subtitle,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),

            /* 9 Você coloca o título a 20 pixels do topo. */
            Positioned(
              top: 20,
              child: Text(
                recipe.title,
                style: FooderlichTheme.darkTextTheme.headline2,
              ),
            ),

            /* 10 Aqui, você posiciona a descrição 30 pixels da parte inferior e 0 à direita. */
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                recipe.message,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
            ),

            /* 11 Por fim, você posiciona o nome do chef a 10 pixels do canto inferior direito. */
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                recipe.authorName,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
