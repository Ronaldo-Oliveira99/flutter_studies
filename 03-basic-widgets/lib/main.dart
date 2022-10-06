import 'package:flutter/material.dart';
//1 Importado o FooderlichTheme.
import 'fooderlich_theme.dart';

import 'home.dart';

void main() {
  // 1 Tudo no Flutter começa com um widget. runApp() recebe o widget raiz Fooderlich.
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {

  // 2.1 Todo widget sem estado deve substituir o método build().
  // const Fooderlich({super.key});
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  
    // TODO: Create theme
    // 2.2 Definida uma variável que contém o tema.
    final theme = FooderlichTheme.dark();

    // TODO: Apply Home widget
    /* 3.1 O widget Fooderlich começa compondo um widget MaterialApp para dar a ele uma aparência e 
    comportamento do sistema Material Design. Veja https://material.io para mais detalhes sobre isso. */  
    return MaterialApp(
      
      /* 3.2 . Adicionada a propriedade de tema do widget MaterialApp. */
      // TODO: Add theme
      theme: theme,
      title: 'Fooderlich',

      home: const Home(),
    );
  }
}
