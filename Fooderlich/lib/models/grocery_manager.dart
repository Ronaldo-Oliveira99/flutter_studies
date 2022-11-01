import 'package:flutter/material.dart';
import 'grocery_item.dart';

/* Cada um desses métodos chama notifyListeners(). Isso notifica os widgets de alterações 
no GroceryManager que exigem uma reconstrução. */
class GroceryManager extends ChangeNotifier {

 /* Este gerenciador mantém um array privado de _groceryItems. Somente o gerente pode 
 alterar e atualizar itens de mercadoria. */
 final _groceryItems = <GroceryItem>[];
 
 /* Fornece um método getter público para groceryItems, que não pode ser modificado. 
 Entidades externas só podem ler a lista de itens de mercearia. */
 List<GroceryItem> get groceryItems => 
List.unmodifiable(_groceryItems);

 // deleteItem() exclui um item em um índice específico.
 void deleteItem(int index) {
  _groceryItems.removeAt(index);
  notifyListeners();
 }

 // addItem() adiciona um novo item de mercearia no final da lista.
 void addItem(GroceryItem item) {
  _groceryItems.add(item);
  notifyListeners();
 }

 // updateItem() substitui o item antigo em um determinado índice por um novo item.
 void updateItem(GroceryItem item, int index) {
  _groceryItems[index] = item;
  notifyListeners();
 }

 // completeItem() ativa e desativa o sinalizador isComplete.
 void completeItem(int index, bool change) {
  final item = _groceryItems[index];
  _groceryItems[index] = item.copyWith(isComplete: change);
  notifyListeners();
 }
}