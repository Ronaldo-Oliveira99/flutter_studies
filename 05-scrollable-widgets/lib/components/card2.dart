import 'package:flutter/material.dart';

import '../fooderlich_theme.dart';
import '../models/models.dart';
import 'author_card.dart';

// FAZENDO UMA JUNCAO DOS COMENTARIOS
// FEITO CARDI1, CARD2, AUTHOR_CARD -? CAP 03 -> 05

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card2({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {

    /* 1 O widget Center tem um widget filho Container que possui três propriedades, 
          sendo as duas primeiras restrições e decoração. */
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),

        // 2 A terceira propriedade é filha e possui um widget Column, que exibe seus filhos verticalmente
        child: Column(
          children: [

            // TODO 1: add author information
            AuthorCard(
              authorName: recipe.authorName,
              title: recipe.role,
              imageProvider: AssetImage(recipe.profileImage),
            ),

              // TODO 4: add Positioned text
            // 1 Com Expanded, você preenche o espaço disponível restante.
            Expanded(

                // 2 Aplique um widget Stack para posicionar os textos uns sobre os outros.
              child: Stack(
                children: [

                  // 3 Posicione o primeiro texto a 16 pixels da parte inferior e 16 pixels da direita.
                  Positioned(
                    bottom: 16,
                    right: 16,
                   
                    child: Text(
                      recipe.title,
                      style: FooderlichTheme.lightTextTheme.headline1,
                    ),
                  ),

                  /* 4 Por fim, posicione o segundo texto a 70 pixels da parte inferior e 16 pixels da 
                    esquerda. Aplique também um widget RotatedBox, que gira o texto três quartos de volta no 
                    sentido horário. Isso faz com que pareça vertical */
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        recipe.subtitle,
                        style: FooderlichTheme.lightTextTheme.headline1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
