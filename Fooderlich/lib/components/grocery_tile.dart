import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  // 1. Você inclui um GroceryItem para configurar o bloco.
  final GroceryItem item;
  /* 2. onComplete é um manipulador de retorno de chamada que permite saber se o 
        usuário ativou ou desativou a caixa de seleção. */
  final Function(bool?)? onComplete;

  // 3. textDecoration ajuda a estilizar todos os textos.
  final TextDecoration textDecoration;

  /* 4. Ao inicializar um GroceryTile, você verifica o item para ver se o usuário o 
      marcou como concluído. Em caso afirmativo, você mostra um aviso ao longo do texto. 
      Caso contrário, você exibe o texto normalmente. */
  GroceryTile({
    Key? key,
    required this.item,
    this.onComplete,
  })  : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO 21: Change this Widget
    return SizedBox(
      height: 100.0,
      // TODO 20: Replace this color
      //--color: Colors.red,
      // 1. Adicione uma Linha para dispor os elementos na direção horizontal.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO 22: Add Row to group (name, date, importance)
          // 2. Adicione um widget de contêiner com a cor do item. Isso ajuda a codificar itens por cores.
          Row(
            children: [
              Container(width: 5.0, color: item.color),
              // 3. Espace os elementos com 16 pixels de distância.
              const SizedBox(width: 16.0),
              // 4. Adicione uma Coluna para dispor os elementos na direção vertical.
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 5. Disponha os elementos com 4 pixels de distância na seguinte ordem: nome do item, data e importancia
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                        decoration: textDecoration,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  buildDate(),
                  const SizedBox(height: 10.0),
                  buildImportance(),
                ],
              ),
            ],
          ),
          // TODO 23: Add Row to group (quantity, checkbox)
          // 6
          Row(
            children: [
              // 7
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                    decoration: textDecoration, fontSize: 21.0),
              ),
              // 8
              buildCheckbox(),
            ],
          ),
        ],
      ),
    );
  }

  // TODO: Add BuildImportance()
  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text('Low', style: GoogleFonts.lato(decoration: textDecoration));
    } else if (item.importance == Importance.medium) {
      return Text('Medium',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w800, decoration: textDecoration));
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
          color: Colors.red,
          fontWeight: FontWeight.w900,
          decoration: textDecoration,
        ),
      );
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  // TODO: Add buildDate()
  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  // TODO: Add buildCheckbox()
  Widget buildCheckbox() {
    return Checkbox(
      // 1. Ativa ou desativa a caixa de seleção com base em item.isComplete.
      value: item.isComplete,
      // 2. Aciona o retorno de chamada onComplete quando o usuário toca na caixa de seleção.
      onChanged: onComplete,
    );
  }
}
