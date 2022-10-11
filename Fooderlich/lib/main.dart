import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

// This widget is the root of your application.

  /*1. O método build() de um widget é o ponto de entrada para compor outros
  widgets para fazer um novo widget. */
  @override
  Widget build(BuildContext context) {

    /*2. Um tema determina aspectos visuais como a cor. 
    O ThemeData padrão mostrará os padrões de Material padrão. */
    final theme = FooderlichTheme.light();

     /*3. O MaterialApp usa o Material Design e é o widget que será incluído no RecipeApp. */
    return MaterialApp(

      /*4. O título do aplicativo é uma descrição que o dispositivo usa para identificar o aplicativo. 
      A interface do usuário não exibirá isso. */
      title: 'Fooderlich',
      
      /*5. Ao copiar o tema e substituir o esquema de cores por uma cópia atualizada, você pode alterar as cores do aplicativo. 
      Aqui, a cor primária é Colors.grey e a cor secundária é Colors.black. */
      theme: theme,

      // TODO: Replace this with MultiProvider


      /*6. Isso ainda usa o mesmo widget MyHomePage de antes, 
      mas agora você atualizou o título e o exibiu no dispositivo. */
      home: const Home(),
    );
  }
}
