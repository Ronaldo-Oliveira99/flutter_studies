import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {

    // 1 CircleImage tem dois parâmetros: imageProvider e imageRadius.
  const CircleImage({
    super.key,
    this.imageProvider,
    this.imageRadius = 20,
  });

  // 2 As declarações de propriedade imageRadius e imageProvider.
  final double imageRadius;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {

     // 3 CircleAvatar é um widget fornecido pela biblioteca de materiais. É definido como um branco
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,

           /* 4 Dentro do círculo externo está outro CircleAvatar, que é um círculo menor que inclui 
      a imagem de perfil do usuário. Tornar o círculo interno menor dá a você a efeito de borda branca */
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}
