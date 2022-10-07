import 'package:flutter/painting.dart';

/* 1 Importância é uma enumeração(unum) que você usará para marcar a importância de um item: 
    baixa,médio ou alto. */
enum Importance {
  low,
  medium,
  high,
}

class GroceryItem {
  
  // 2 Cada GroceryItem deve ter um id exclusivo para diferenciar os itens de um outro.
  final String id;

  /* 3 Um usuário pode definir o nome, nível de importância, etiqueta de cor, quantidade e data, 
       conforme bem como marcar itens concluídos. */
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;
  
  GroceryItem({
    required this.id,
    required this.name,
    required this.importance,
    required this.color,
    required this.quantity,
    required this.date,
    this.isComplete = false,
  });

  /* 4 copyWith copia e cria uma instância completamente nova de GroceryItem. este
        será útil mais tarde, quando você gerenciar o estado dos itens. */
  GroceryItem copyWith({
    String? id,
    String? name,
    Importance? importance,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isComplete,
  }) {
    return GroceryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        importance: importance ?? this.importance,
        color: color ?? this.color,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
