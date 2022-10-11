import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1.1 Crie um MockFooderlichService, para simular as respostas do servidor.
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    //1 Dentro do build() do widget, você cria um FutureBuilder.
    /* 1.2 Este é o FutureBuilder de antes. Ele executa uma tarefa assíncrona e permite
          você conhece o estado do futuro. */
    return FutureBuilder(

      /* 2.1 O FutureBuilder recebe um Future como parâmetro. getExploreData() cria um futuro que,
       por sua vez, retornará uma instância ExploreData. Essa instância conterá duas listas, 
       todayRecipes e friendPosts. 
         2.2 Use seu serviço simulado para chamar getExploreData(). Isso retorna um futuro do objeto ExploreData. */
      future: mockService.getExploreData(),

      /* 3.1 No construtor(builder), você usa o snapshot para verificar o estado atual do Futuro.
         3.2 Verifique o estado do futuro no retorno de chamada do construtor. */
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // TODO: Add Nested List Views

        /* 4.1 Agora, o Future está completo e você pode extrair os dados para passar para o seu widget.
           4.2 Verifique se o futuro está completo(done). */
        if (snapshot.connectionState == ConnectionState.done) {

          /* 5 snapshot.data retorna ExploreData, do qual você extrai todayRecipes para passar para a 
            visualização de lista. Agora, você mostra um texto simples como um espaço reservado. Você 
            vai construir um TodayRecipeListView em breve. */
          //--final recipes = snapshot.data?.todayRecipes ?? [];

          // TODO: Replace this with TodayRecipeListView
          //--return TodayRecipeListView(recipes: recipes);

          /*5.2 Quando o futuro estiver completo, retorne o ListView primário. Isso contém uma lista 
              explícita de filhos. Nesse cenário, o ListView primário conterá os outros dois ListViews como filhos. */
          return ListView(

            // 6.2 Defina a direção de rolagem para vertical, embora esse seja o valor padrão.
            scrollDirection: Axis.vertical,
            children: [

              // 7.2 O primeiro item em filhos é TodayRecipeListView. Você passa na lista de todayRecipes do ExploreData.
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),

              // 8.2 Adicione um espaço vertical de 16 pontos para que as listas não fiquem muito próximas umas das outras.
              const SizedBox(height: 16),

              // 9.2 Adicione um contêiner de espaço reservado verde. Você criará e adicionará o FriendPostListView posteriormente.
              // TODO: Replace this with FriendPostListView
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
            ],
          );
        } else {
          /* 6 O futuro ainda está carregando, então você mostra um spinner para informar o 
          usuário de algo está acontecendo. */
          // 10.2 Se o futuro ainda não terminou de carregar, mostre um indicador de progresso circular.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
