import 'package:flutter/material.dart';
import 'screens/explore_screen.dart';
import 'screens/recipes_screen.dart';
import 'screens/grocery_screen.dart';

// 1.2 Sua nova classe estende StatefulWidget.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  // TODO: Add state variables and functions
  /* 7.2  _selectedIndex mantém o controle de qual guia está selecionada no momento. O sublinhado em _selectedIndex
   significa que é privado. O índice selecionado é o estado que está sendo rastreado por _HomeState. */
  int _selectedIndex = 0;

 /* 8.2 Aqui, você define os widgets que serão exibidos em cada guia. Por enquanto, quando você toca entre os 
    diferentes itens da barra de guias, ele mostra widgets de contêiner de cores diferentes. Em breve, 
    você substituirá cada um deles por widgets de cartão. */
  static List<Widget> pages = <Widget>[

     // TODO: Replace with Card1
    //--Container(color: Colors.red),
    //--const Card1(),
    ExploreScreen(),

    // TODO: Replace with Card2
    //--Container(color: Colors.green),
    //--const Card2(),
    RecipesScreen(),
    
    
    // TODO: Replace with grocery screen

    // TODO: Replace with Card3
    //--Container(color: Colors.blue)
    //--const Card3(),
    //--Container(color: Colors.blue),
    const GroceryScreen(),
  ];

 /* 9.2 Esta função lida com itens da barra de guias tocados. Aqui, você define o índice do item que o 
    usuário pressionou. setState() notifica o framework que o estado deste objeto foi alterado, então 
    reconstrói este widget internamente */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    /* O widget MaterialApp contém um widget Scaffold, que define o layout e a estrutura do aplicativo. 
      O scaffold tem duas propriedades: um appBar e um body. O título de uma Appbar contém um widget de texto. 
      O corpo tem um widget Center, cuja propriedade filho é um widget Text. */

    // TODO: Wrap inside a Consumer Widget
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',

           /* 2.2 O estilo AppBar agora é: Theme.of(context).textTheme.headline6 em vez de: theme.textTheme.headline6. 
          Theme.of(context) retorna o tema mais próximo na árvore de widgets. Se o widget tiver um Tema definido, ele 
          o retornará. Caso contrário, ele retorna o tema do aplicativo. */
          style: Theme.of(context).textTheme.headline6,
        ),
      ),

       // TODO: Show selected tab
      body: pages[_selectedIndex],

      // TODO: Style the body text
      //body: const Center(child: Text('Let\'s get cooking 👩‍🍳')),
      //body: Center(
      //     child: Text('Let\'s get cooking 👩‍🍳',

               // 5.1 Finalmente, adicionado estilo de texto do corpo.
               // 3.2 Assim como na AppBar, você também atualizou o estilo Text para usar o Theme.of(context).
                //style: Theme.of(context).textTheme.headline1)),

      // TODO: Add bottom navigation bar
      // 4.2 Definido um BottomNavigationBar.
      bottomNavigationBar: BottomNavigationBar(

        // 5.2 Defina a cor de seleção de um item quando tocado.
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,

         // TODO: Set selected tab bar

        // 10.2 currentIndex informará à barra de navegação inferior qual item da barra de guias deve ser destacado.
        currentIndex: _selectedIndex,

         /* 11.2 Quando o usuário toca em um item da barra de guias, ele chama o manipulador _onItemTapped, que 
          atualiza o estado com o índice correto. Neste caso, ele trava a cor. */
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To Buy',
          ),
        ],
      ),
    );
  }
}
