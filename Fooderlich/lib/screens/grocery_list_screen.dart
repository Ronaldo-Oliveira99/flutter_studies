import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

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
          return GroceryTile(
            key: Key(item.id),
            item: item,
            // 6. Retorne onComplete quando o usuário tocar na caixa de seleção.
            onComplete: (change) {
              // 7. Verifique se há uma alteração e atualize o status isComplete do item.
              if (change != null) {
                manager.completeItem(index, change);
              }
            },
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