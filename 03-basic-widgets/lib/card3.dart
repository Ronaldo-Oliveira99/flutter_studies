import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            // TODO 5: add dark overlay BoxDecoration
            Container(
              decoration: BoxDecoration(
                /* 1 Você adiciona um contêiner com uma sobreposição de cores com um fundo semitransparente de 
                  60% para tornar a imagem mais escura. */
                color: Colors.black.withOpacity(0.6),

                // 2 Isso dá a aparência de cantos de imagem arredondados.
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),

            // TODO 6: Add Container, Column, Icon and Text
            Container(
              // 3 Aplique preenchimento de 16 pixels em todos os lados.
              padding: const EdgeInsets.all(16),
              // 4 Configure uma Coluna filha para dispor os widgets verticalmente.
              child: Column(
                // 5 Posicione todos os widgets à esquerda da coluna.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 6 Adicione um ícone de livro.
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  // 7 Aplique um espaço de 8 pixels verticalmente.
                  const SizedBox(height: 8),
                  // 8 Adicione o widget de texto.
                  Text(
                    'Recipe Trends',
                    style: FooderlichTheme.darkTextTheme.headline2,
                  ),
                  // 9 Aplique um espaço de 30 pixels verticalmente.
                  const SizedBox(height: 30),
                ],
              ),
            ),
            // TODO 7: Você adiciona um widget Center.
            
            //10. Você adiciona um widget Center.
            Center(

              /* 11 Wrap é um widget de layout que tenta colocar cada um de seus childs adjacentes aos childs 
                anteriores. Se não houver espaço suficiente, ele passa para a próxima linha. */
              child: Wrap(

                // 12 Coloque as childs o mais próximo possível da esquerda, ou seja, do início.
                alignment: WrapAlignment.start,

                // 13 Aplique um espaço de 12 pixels entre cada child.
                spacing: 12,
              
                // 14 Adicione a lista de widgets de Chip.
                children: [
                  Chip(
                    label: Text('Healthy',
                        style: FooderlichTheme.darkTextTheme.bodyText1),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      print('delete');
                    },
                  ),
                  Chip(
                    label: Text('Vegan',
                        style: FooderlichTheme.darkTextTheme.bodyText1),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      print('delete');
                    },
                  ),
                  Chip(
                    label: Text('Carrots',
                        style: FooderlichTheme.darkTextTheme.bodyText1),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text('Greens',
                        style: FooderlichTheme.darkTextTheme.bodyText1),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text('Wheat',
                        style: FooderlichTheme.darkTextTheme.bodyText1),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text('Pescetarian',
                        style: FooderlichTheme.darkTextTheme.bodyText1),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text('Mint',
                        style: FooderlichTheme.darkTextTheme.bodyText1),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text('Lemongrass',
                        style: FooderlichTheme.darkTextTheme.bodyText1),
                    backgroundColor: Colors.black.withOpacity(0.7),
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
