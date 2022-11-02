import 'package:flutter/material.dart';
//import 'empty_grocery_screen.dart';

import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO 3: Replace and add layout widgets
    //--return Container(color: Colors.purple);

    // 1 Preenchimento: Adiciona 30 pixels em todos os lados.
    return Padding(
      padding: const EdgeInsets.all(30.0),
      
      // 2 Centro: Coloca todos os outros widgets no centro.
      child: Center(

        // 3 Coluna: Manipula os layouts verticais dos outros widgets.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // TODO 4: Add empty image
            // 1 Flexível dá à child a capacidade de preencher o espaço disponível no eixo principal.
            Flexible(
              
              /* 2  AspectRatio dimensiona seu child para o aspectRatio especificado. Embora aspectRatio  é duplo, a
                    documentação do Flutter recomenda escrevê-lo como largura /altura em vez do resultado calculado.
                    Neste caso, você quer um aspecto quadrado proporção de 1 / 1 e não 1,0. */
              child: AspectRatio(
                aspectRatio: 1 / 1,

                //child: Image.asset('assets/fooderlich_assets/empty_list.png'),
                child: Image.asset('assets/fooderlich_assets/empty_list.png'),
                //--child: Image.asset('assets/fooderlich_assets/empty_list.png'),
                //--child: Image.asset('assets/food_pics/empty.jpg'),
                
              ),
            ),

            // TODO 5: Add empty screen title
            const Text(
              'No Groceries',
              style: TextStyle(fontSize: 21.0),
            ),

            // TODO 6: Add empty screen subtitle
            const SizedBox(height: 16.0),
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),

            // TODO 7: Add browse recipes button
            MaterialButton(
              textColor: Colors.white,
              child: const Text('Browse Recipes'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              onPressed: () {

                // TODO 8: Go to Recipes Tab
                /**Aqui, você usa Provider.of() para acessar o objeto de modelo,TabManager.goToRecipes() 
                * define o índice para a guia Receitas.isso notifica o consumidor para reconstruir a página 
                * inicial com o índice da guia direita
                */
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
            ),
          ],
        ),
      ),
    );
  }
}
