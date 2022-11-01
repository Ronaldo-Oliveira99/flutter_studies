import 'package:flutter/material.dart';


//1 TabManager extends ChangeNotifier. 
//Isso permite que o objeto forneça alterações notificações aos seus ouvintes.
class TabManager extends ChangeNotifier {

  // 2 selectedTab mantém o controle de qual guia o usuário tocou.
  int selectedTab = 0;

  // 3 goToTab é uma função simples que modifica o índice da guia atual.
  void goToTab(index) {

    // 4 Armazena o índice da nova guia que o usuário tocou.
    selectedTab = index;

    // 5 Chama notifyListeners() para notificar todos os widgets que escutam este estado.
    notifyListeners();
  }

  // 6 goToRecipes() é uma função específica que define selectedTab para a guia Receitas, que está no índice 1.
  void goToRecipes() {
    selectedTab = 1;
    
    // 7 Notifica todos os widgets que escutam TabManager que Receitas é a guia selecionada.
    notifyListeners();
  }
}
