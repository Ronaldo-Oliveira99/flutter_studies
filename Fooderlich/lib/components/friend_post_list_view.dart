import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class FriendPostListView extends StatelessWidget {

  // 1 FriendPostListView requer uma lista de Posts.
  final List<Post> friendPosts;

  const FriendPostListView({
    super.key,
    required this.friendPosts,
  });

  @override
  Widget build(BuildContext context) {
    // 2 Aplique um widget de preenchimento(padding) esquerdo e direito de 16 pontos.
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),

      // 3 Crie uma Coluna para posicionar o Texto seguido das postagens em um layout vertical.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 4 Crie o cabeçalho do widget Texto.
          Text(
            'Social Chefs 👩‍🍳',
            style: Theme.of(context).textTheme.headline1,
          ),

          // 5 Aplique um espaçamento de 16 pixels na vertical.
          const SizedBox(height: 16),

          // TODO: Add PostListView here
          // 1.2 Crie ListView.separated com dois retornos de chamada IndexWidgetBuilder.
          ListView.separated(

             /* 2.2 Como você está aninhando duas exibições de lista, é uma boa ideia definir primária como falsa. 
                 Este permite ao Flutter saber que esta não é a visualização de rolagem principal. */
              primary: false,

              /* 3.2  Defina a física de rolagem para NeverScrollableScrollPhysics. Mesmo que você defina primário como falso, 
            também é uma boa ideia desabilitar a rolagem para esta exibição de lista. Isso se propagará até a exibição de lista pai.*/ 
              physics: const NeverScrollableScrollPhysics(),

               /*4.2  Defina shrinkWrap como true para criar uma lista de itens roláveis de comprimento fixo. este
                  dá-lhe uma altura fixa. Se isso fosse falso, você obteria um erro de altura ilimitado.*/
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: friendPosts.length,
              itemBuilder: (context, index) {

                 // 5.2 Para cada item da lista, crie um FriendPostTile.
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },

              // 6.2 Para cada item, crie também uma SizedBox para espaçar cada item em 16 pontos.
              separatorBuilder: (context, index) {

                // 6 Deixe algum preenchimento no final da lista
                return const SizedBox(height: 16);
              }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
