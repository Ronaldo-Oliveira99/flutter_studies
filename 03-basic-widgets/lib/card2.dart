import 'package:flutter/material.dart';
import 'author_card.dart';
import 'fooderlich_theme.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      /* 1 O widget Center tem um widget filho Container que possui três propriedades, 
           sendo as duas primeiras restrições e decoração. */
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag5.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),

        // 2 A terceira propriedade é filha e possui um widget Column, que exibe seus filhos verticalmente
        child: Column(
          children: [
            // TODO 1: add author information
            const AuthorCard(
              authorName: 'Mike Katz',
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage('assets/author_katz.jpeg'),
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
                      'Recipe',
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
                        'Smoothies',
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
