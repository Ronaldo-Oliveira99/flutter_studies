import 'package:flutter/material.dart';

import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {

    /* 1 Esta classe requer um SimpleRecipe como parâmetro. Isso ajuda a 
      configurar sua ferramenta. */

  final SimpleRecipe recipe;

  const RecipeThumbnail({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {

    /* 2 Crie um Container com preenchimento de 8 pontos ao redor. 
        Você quer que a imagem preencha o espaço restante. */
    return Container(
      padding: const EdgeInsets.all(8),

      // 3 Use uma Coluna para aplicar um layout vertical.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 4 O primeiro elemento da coluna é Expandido, cujo widget mantém uma Imagem.
          Expanded(

            // 5 A imagem está dentro do ClipRRect, que recorta a imagem para fazer as bordas arredondada.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                recipe.dishImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

           // 6 Adicione algum espaço entre a imagem e os outros widgets.
          const SizedBox(height: 10),

           /* 7 Adicione os textos restantes: um para exibir o título da receita e outro para 
               exibir a duração. */
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
