import 'recipe_detail.dart';
import 'package:flutter/material.dart';
import 'recipe.dart';

 void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.

  /*1. O método build() de um widget é o ponto de entrada para compor outros
  widgets para fazer um novo widget. */
  @override
  Widget build(BuildContext context) {
    /*2. Um tema determina aspectos visuais como a cor. 
    O ThemeData padrão mostrará os padrões de Material padrão. */
    final ThemeData theme = ThemeData();

    /*3. O MaterialApp usa o Material Design e é o widget que será incluído no RecipeApp. */
    return MaterialApp(
      /*4. O título do aplicativo é uma descrição que o dispositivo usa para identificar o aplicativo. 
      A interface do usuário não exibirá isso. */
      title: 'Recipe Calculator',

      /*5. Ao copiar o tema e substituir o esquema de cores por uma cópia atualizada, você pode alterar as cores do aplicativo. 
      Aqui, a cor primária é Colors.grey e a cor secundária é Colors.black. */
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),

      /*6. Isso ainda usa o mesmo widget MyHomePage de antes, 
      mas agora você atualizou o título e o exibiu no dispositivo. */
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    /** 1. Um Scaffold fornece a estrutura de alto nível para uma tela. Neste caso, você está 
     * usando duas propriedades: */
    return Scaffold(
      /** 
       * 2. AppBar obtém uma propriedade de título usando um widget de texto que tem um título passado 
       * de home: MyHomePage(title: 'Recipe Calculator') na etapa anterior.  */
      appBar: AppBar(
        title: Text(widget.title),
      ),

      /** 
       * 3. O corpo possui SafeArea, que evita que o aplicativo fique muito próximo das interfaces 
       * do sistema operacional, como o entalhe ou áreas interativas, como o Home Indicator na parte
       * inferior como em algumas telas de IOS */
      body: SafeArea(
        // TODO: Replace child: Container()

        /** 
         * 4.1 SafeArea tem um widget filho(child), que é um widget Container vazio 
         * 4.2 Cria uma lista usando ListView. */
        child: ListView.builder(
          /**5.2 itemCount determina o número de linhas que a lista possui. Nesse caso, 
           * comprimento é o número de objetos na lista Recipe.samples. */
          itemCount: Recipe.samples.length,

          /** 6.2 O itemBuilder constrói a árvore de widgets para cada linha. */
          itemBuilder: (BuildContext context, int index) {
            
            /** 7.2 Um widget de texto exibe o nome da receita. e (modificações) */
            //return Text(Recipe.samples[index].label);
            
            // TODO 1: Update to return Recipe card
            //return buildRecipeCard(Recipe.samples[index]);
            
            // TODO 2: GestureDetector
            //7.2 Apresenta um widget GestureDetector, que, como o nome indica, detecta gestos.
            return GestureDetector(

              // 8.2 Implementa uma função onTap, que é o retorno de chamada chamado quando o widget é tocado.
              onTap: () {
                
                /* 9.2 O widget Navigator gerencia uma pilha de páginas. Chamar push() com um MaterialPageRoute enviará uma nova 
                página de material para a pilha. Seção III,“Navigating Between Screens” abordará a navegação com muito mais detalhes. */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      
                      //return Text('Detail page');
                 
                      // 10.2 O construtor cria o widget de página de destino.
                      // TODO: Replace return with return RecipeDetail()
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },

              // 11.2 O widget filho do GestureDetector define a área onde o gesto está ativo.
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }

  // TODO: Add buildRecipeCard() here
  Widget buildRecipeCard(Recipe recipe) {
    // 1.1. Você retorna(devolve) um Cartão de buildRecipeCard().
    return Card(
      // 1.2 A elevação de um cartão determina o quão alto o cartão está fora da tela, afetando sua sombra.
      elevation: 2.0,

      // 2.2 shape lida com a forma do cartão. Este código define um retângulo arredondado com um raio de canto de 10,0.
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      // 3.2 O preenchimento insere o conteúdo de seu filho pelo valor de preenchimento especificado.
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        // 2.1. A propriedade filha do Cartão é uma Coluna. Uma coluna é um widget que define um layout vertical.
        //4.2 O preenchimento filho ainda é a mesma Coluna vertical com a imagem e o texto.
        child: Column(
          // 3.1. A Coluna possui dois filhos.
          children: <Widget>[
            /* 4.1. O primeiro filho é um widget de Imagem. 
              * AssetImage informa que a imagem é buscada no pacote de ativos local definido em pubspec.yaml. */
            Image(image: AssetImage(recipe.imageUrl)),

            // 5.2 Entre a imagem e o texto está uma SizedBox. Esta é uma exibição em branco com um tamanho fixo.
            const SizedBox(
              height: 14.0,
            ),

            // 5.1. Um widget de texto é o segundo filho. Ele conterá o valor recipe.label.
            /* 6.2 Você pode personalizar widgets de texto com um objeto de estilo. Nesse caso, 
                  você especificou uma fonte Palatino com tamanho 20.0 e peso em negrito de w700. */
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
