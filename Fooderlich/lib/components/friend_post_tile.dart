import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

// Construindo o bloco para a postagem de um amigo (card)

class FriendPostTile extends StatelessWidget {
  final Post post;

  const FriendPostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {

    // 1 Crie uma linha para organizar os widgets horizontalmente.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

         // 2 O primeiro elemento é um avatar circular, que exibe o recurso de imagem associado à postagem.
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),

         // 3 Aplique um preenchimento de 16 pixels.
        const SizedBox(width: 16),

        // 4 Criar Expandido, o que faz com que os filhos preencham o restante do container.
        Expanded(

           // 5 Estabeleça uma Coluna para organizar os widgets verticalmente.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

               // 6 Crie um texto para exibir os comentários do seu amigo.
              Text(post.comment),

              // 7 Crie outro Texto para exibir o timestamp de uma postagem.
              Text(
                '${post.timestamp} mins ago',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
