import 'package:flutter/material.dart';
import 'empty_grocery_screen.dart';

import 'package:provider/provider.dart';
import '../models/models.dart';

import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';


// Building GroceryScreen (PRINCIPAL)

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO 2: Replace with EmptyGroceryScreen
    //--return Container(color: Colors.orange);

    // TODO 4: Add a scaffold widget
    //-- return const EmptyGroceryScreen();
    // 5 A estrutura de layout principal do GroceryScreen é um scaffold.
    return Scaffold(
      /* 6 . Adiciona um botão de ação flutuante com um ícone +. Tocar no botão 
      apresenta a tela para criar ou adicionar um item. Você construirá esta tela 
      mais tarde. */
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO 11: Present GroceryItemScreen

          // 1 Retorna o GroceryManager disponível na árvore.
          final manager = Provider.of<GroceryManager>(context, listen: false);
          // 2 Navigator.push() adiciona uma nova rota à pilha de rotas.
          Navigator.push(
            context,

            /* 3 O MaterialPageRoute substitui a tela inteira por uma transição específica 
            * da plataforma. No Android, por exemplo, ele desliza para cima e aparece 
            * gradualmente. No iOS, ele desliza da direita. */
            MaterialPageRoute(

              // 4 Cria um novo GroceryItemScreen no retorno de chamada do construtor da rota.
              builder: (context) => GroceryItemScreen(
                
                // 5 onCreate define o que fazer com o item criado.
                onCreate: (item) {
                  
                  // 6 addItem() adiciona este novo item à lista de itens.
                  manager.addItem(item);

                  /* 7 Depois que o item é adicionado à lista, pop remove o item da rota de navegação superior, 
                    GroceryItemScreen, para mostrar a lista de itens de mercearia. */
                  Navigator.pop(context);
                },
                // 8 onUpdate nunca será chamado porque você está criando um novo item.
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
      // 7 Constrói o restante da subárvore da tela grocery.
      body: buildGroceryScreen(),
    );
  }

  // TODO: Add buildGroceryScreen
  Widget buildGroceryScreen() {
    //1 Você envolve seus widgets dentro de um Consumer, que escuta o GroceryManager
    return Consumer<GroceryManager>(
      /*2 O consumidor reconstrói os widgets abaixo de si mesmo quando os itens 
      do gerente de supermercado são alterados. */
      builder: (context, manager, child) {
        /*3 Se houver itens de mercearia na lista, mostre o GroceryListScreen. 
        Você criará essa tela em breve. */
        if (manager.groceryItems.isNotEmpty) {
          // TODO 25: Add GroceryListScreen
          //--return Container();
          return GroceryListScreen(manager: manager);
         
        } else {
          // 4 Se não houver itens de mercearia, mostre EmptyGroceryScreen.
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
