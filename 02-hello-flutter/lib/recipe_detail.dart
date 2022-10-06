import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);
  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

// TODO: Add _RecipeDetailState here
class _RecipeDetailState extends State<RecipeDetail> {
  // TODO: Add _sliderVal here
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    // 1 Scaffold define a estrutura geral da página.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),

      // 2 No corpo, há uma SafeArea, uma Column com um Container, uma SizedBox e Text filhos.
      body: SafeArea(
        /* 3 SafeArea evita que o aplicativo fique muito próximo das interfaces do sistema operacional, 
        como o entalhe ou a área interativa da maioria dos iPhones. */
        child: Column(
          children: <Widget>[
            /* 4 Uma novidade é o SizedBox em torno da imagem, que define limites redimensionáveis para a 
            imagem. Aqui, a altura é fixada em 300, mas a largura será ajustada para se ajustar à proporção. 
            A unidade de medida no Flutter é pixels lógicos. */
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),

            // 5 Existe um espaçador SizedBox.
            const SizedBox(
              height: 4,
            ),

            /* 6 O texto do rótulo tem um estilo um pouco diferente do cartão principal, 
            para mostrar o quanto de personalização está disponível. */
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),

            // TODO: Add Expanded
            /* 7 Um widget Expandido, que se expande para preencher o espaço em uma Coluna. 
                Desta forma, a lista de ingredientes ocupará o espaço não preenchido pelos outros widgets. */
            Expanded(
              // 8 Um ListView, com uma linha por ingrediente.
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  
                  /* 9 Um texto que usa interpolação de string para preencher uma string com valores de tempo 
                  de execução. Você usa a sintaxe ${expression} dentro da string literal para denotar isso. */
                  //return Text('${ingredient.quantity} ${ingredient.measure} ${ingredient.name}');

                  // TODO: Add ingredient.quantity
                  return Text('${ingredient.quantity * _sliderVal} '
                              '${ingredient.measure} '
                              '${ingredient.name}');
                
                },
              ),
            ),

            // TODO: Add Slider() here
            Slider(

              /* 10 Você usa min, max e divisões para definir como o controle deslizante se move. 
              Neste caso, move-se entre os valores de 1 e 10, com 10 paradas discretas. Ou seja, só pode ter valores de 1, 2, 3, 4, 5, 6, 7, 8, 9 ou 10.   */
              min: 1,
              max: 10,
              divisions: 10,

              // 11 Atualizações de rótulos à medida que o _sliderVal muda e exibe um número escalonado de porções.
              label: '${_sliderVal * widget.recipe.servings} servings',
              
              // 12 O controle deslizante funciona em valores duplos, então isso converte a variável int.
              value: _sliderVal.toDouble(),
              
              /* 13 Por outro lado, quando o controle deslizante é alterado, ele usa round() para converter o
              valor do controle deslizante duplo em um int e, em seguida, salva-o em _sliderVal. */
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },

              /* 14 Isso define as cores do controle deslizante para algo mais "na marca". 
              O activeColor é a seção entre o valor mínimo e o thumb, e o inactiveColor representa o resto */
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
