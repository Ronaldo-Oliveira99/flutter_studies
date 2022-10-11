import 'package:flutter/material.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

// Construindo a tela Receitas

class RecipesScreen extends StatelessWidget {

  // 1 Crie um serviço simulado. (mock service)
  final exploreService = MockFooderlichService();
  RecipesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // 2 Crie um FutureBuilder.
    return FutureBuilder(

      /* 3 Use getRecipes() para retornar a lista de receitas a serem exibidas. 
           Esta função retorna uma lista futura de SimpleRecipes. */
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {

        // 4 Verifique se o futuro está completo.
        if (snapshot.connectionState == ConnectionState.done) {

          // TODO: Add RecipesGridView Here
          // 5 Adicione um texto de espaço reservado até construir RecipesGridView.
          //--return const Center(child: Text('Recipes Screen'));
          return RecipesGridView(recipes: snapshot.data ?? []);
          
        } else {

          // 6 Mostre um indicador de carregamento circular se o futuro ainda não estiver completo.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
