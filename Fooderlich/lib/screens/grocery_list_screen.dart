import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

// Tela que lista os produtos apos criados
class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO 26: Replace with ListView

    // 1. Obtenha a lista de itens de mercearia do gerente.
    final groceryItems = manager.groceryItems;

    // 2. Aplique padding de 16 pixels em toda a tela.
    //-return Container();
    return Padding(
      padding: const EdgeInsets.all(16.0),

      // 3. Adicione ListView.
      child: ListView.separated(
        // 4. Defina o número de itens na lista.
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          // TODO 28: Wrap in a Dismissable

          // TODO 27: Wrap in an InkWell

          // 5. Para cada item na lista, obtenha o item atual e construa um GroceryTile.
          // return GroceryTile(
          //   key: Key(item.id),
          //   item: item,

          //   // 6. Retorne onComplete quando o usuário tocar na caixa de seleção.
          //   onComplete: (change) {

          //     // 7. Verifique se há uma alteração e atualize o status isComplete do item.
          //     if (change != null) {
          //       manager.completeItem(index, change);
          //     }
          //   },
          // );

          //**replace the existing return GroceryTile()
          // 1. Você envolve GroceryTile dentro de um InkWell. 
          // pag 260
          return Dismissible(

            /* 6. O widget dispensável inclui uma Chave. Flutter precisa disso para encontrar e remover o
                  elemento direito na árvore. */ 
            key: Key(item.id),

            // 7. Define a direção que o usuário pode deslizar para dispensar.
            direction: DismissDirection.endToStart,

            /* 8. Seleciona o widget de plano de fundo para exibir atrás do widget que você está passando. 
                  Neste caso, o widget de fundo é vermelho com uma lixeira branca Ícone alinhado no centro e 
                  à direita do Container */
            background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete_forever,
                    color: Colors.white, size: 50.0)),

            // 9. onDismissed permite que você saiba quando o usuário swiped um GroceryTile.
            onDismissed: (direction) {

              // 10. Permite que o  grocery manager lide com a exclusão do item, dado um índice.
              manager.deleteItem(index);

              // 11. Mostra um widget de snack bar para informar ao usuário qual item ele excluiu.
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} dismissed')));
            },
            child: InkWell(
              child: GroceryTile(
                  key: Key(item.id),
                  item: item,
                  onComplete: (change) {
                    if (change != null) {
                      manager.completeItem(index, change);
                    }
                  }),

              /* 2. Quando o gesto reconhece um toque, apresenta GroceryItemScreen, 
                   permitindo que o usuário edite o item atual. */
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroceryItemScreen(
                      originalItem: item,

                      // 3. GroceryItemScreen chama onUpdate quando o usuário atualiza um item.
                      onUpdate: (item) {
                        // 4. O GroceryManager atualiza o item no índice específico.
                        manager.updateItem(item, index);

                        // 5. Dispensa GroceryItemScreen.
                        Navigator.pop(context);
                      },

                      // 6. onCreate não será chamado porque você está atualizando um item existente.
                      onCreate: (item) {},
                    ),
                  ),
                );
              },
            ),
          );
        },

        // 8. Espace cada item de mercearia com 16 pixels de distância.
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
