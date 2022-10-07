import 'package:flutter/material.dart';

import '../fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {

   /* 1.1 AuthorCard tem três propriedades: authorName, o cargo do autor e a imagem do perfil, 
       que imageProvider trata. */
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  @override
  AuthorCardState createState() => AuthorCardState();
}

class AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

/* 2.1 AuthorCard é agrupado em um contêiner e usa um widget de linha para dispor os outros widgets 
       horizontalmente */
  @override
  Widget build(BuildContext context) {
    //TODO: Replace return Container(...);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
         // TODO 3: add alignment
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //1.2 linha interna agrupa a CircleImage e as informações de texto do autor.
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),

              // 2.2 Aplica 8 pixels de preenchimento entre a imagem e o texto.
              const SizedBox(width: 8),

              /* 3.2 Apresenta o nome e o cargo do autor verticalmente usando uma Coluna. Recarregue a quente e 
                 toque no botão da barra de guias do Card2. Seu aplicativo agora ficará assim: */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  )
                ],
              ),
            ],
          ),

          // TODO 2: add IconButton
          IconButton(

             // 4 Defina o ícone, tamanho e cor do ícone.

              /*1.2 Primeiro, ele verifica se o usuário adicionou este cartão de receita aos favoritos. 
                    Se for verdade, ele mostra um preenchido coração. Se falso, mostra um coração delineado. */
              //--icon: const Icon(Icons.favorite_border),
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,

            //2.2 Ele muda a cor para vermelho para dar mais vida ao aplicativo.
              //--color: Colors.grey[400],
            color: Colors.red[400],

            // 5 Quando o usuário pressiona o ícone, exibe uma snackbar
            onPressed: () {

              /* 3.2 Quando o usuário pressiona o IconButton, ele alterna o estado _isFavorited por meio 
                      de um chamado para setState() */
                //--const snackBar = SnackBar(content: Text('Favorite Pressed'));
                //--ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
          ),
        ],
      ),
    );
  }
}
