import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import '../components/grocery_tile.dart';

class GroceryItemScreen extends StatefulWidget {
  // 1 onCreate é um retorno de chamada que permite saber quando um novo item é criado.
  final Function(GroceryItem) onCreate;

  // 2 onUpdate é um retorno de chamada que retorna o item de mercearia atualizado.
  final Function(GroceryItem) onUpdate;

  // 3 O item de mercearia em que o usuário clicou.
  final GroceryItem? originalItem;

  // 4 isUpdating determina se o usuário está criando ou editando um item
  final bool isUpdating;
  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);
  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  // TODO: Add grocery item screen state properties
  // 1 _nameController é um TextEditingController. Este controlador escuta o texto
  final _nameController = TextEditingController();

  // 2. _name armazena o nome do item.
  String _name = '';

  // 3. _importance armazena o nível de importância.
  Importance _importance = Importance.low;

  //4. _dueDate armazena a data e hora atuais.
  DateTime _dueDate = DateTime.now();

  //5. _timeOfDay armazena a hora atual.
  TimeOfDay _timeOfDay = TimeOfDay.now();

  //6. _currentColor armazena o rótulo de cor.
  Color _currentColor = Colors.green;

  //7. _currentSliderValue armazena a quantidade de um item.
  int _currentSliderValue = 0;

  // TODO: Add initState()
  @override
  void initState() {
    /* 1 Quando o originalItem não é nulo, o usuário está editando um item existente. 
      Neste caso, você deve configurar o widget para mostrar os valores do item. */
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    /* 2 Adiciona um ouvinte para ouvir as alterações do campo de texto. Quando o texto muda, 
    você define o _name. */
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  // TODO: Add dispose()
  // Isso descartará seu TextEditingController quando você não precisar mais dele.
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO 12: Add GroceryItemScreen Scaffold
    //--return Container(color: Colors.orange);
    // 1 O Scaffold define o layout principal e a estrutura de toda a tela.
    return Scaffold(
      /* 2 Inclui uma barra de aplicativos com um botão de ação. O usuário tocará neste botão quando 
       terminar de criar um item. */
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // TODO 24: Add callback handler
              // 1. Quando o usuário toca em Salvar, você pega todas as propriedades de estado e cria um GroceryItem.
              final groceryItem = GroceryItem(
                id: widget.originalItem?.id ?? const Uuid().v1(),
                name: _nameController.text,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
              );
              if (widget.isUpdating) {
                // 2. Se o usuário estiver atualizando um item existente, chame onUpdate.
                widget.onUpdate(groceryItem);
              } else {
                // 3. Se o usuário estiver criando um novo item, chame onCreate.
                widget.onCreate(groceryItem);
              }
            },
          )
        ],

        /* 3 Inclui uma barra de aplicativos com um botão de ação. 
        O usuário tocará neste botão quando terminar de criar um item. */
        elevation: 0.0,

        // 4 Define o título da barra de aplicativos.
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),

      /* 5 Mostra um ListView, preenchido por 16 pixels em cada lado, dentro do corpo do scaffold. 
      Você preencherá essa visualização de lista com vários widgets interativos em breve. */
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // TODO 13: Add name TextField
            buildNameField(),

            // TODO 14: Add Importance selection
            buildImportanceField(),

            // TODO 15: Add date picker
            buildDateField(context),

            // TODO 16: Add time picker
            buildTimeField(context),

            // TODO 17: Add color picker
            const SizedBox(height: 10.0),
            buildColorPicker(context),

            // TODO 18: Add slider
            const SizedBox(height: 10.0),
            buildQuantityField(),

            // TODO: 19: Add Grocery Tile
            GroceryTile(
              item: GroceryItem(
                id: 'previewMode',
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TODO: Add buildNameField()
  Widget buildNameField() {
    // 1. Cria uma Coluna para dispor os elementos verticalmente.
    return Column(
      // 2. Alinha todos os widgets na coluna à esquerda.
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 3. Adiciona um texto estilizado usando GoogleFonts.
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        // 4. Adiciona um TextField para inserir o nome do item.
        TextField(
          // 5. Define o TextEditingController do TextField.
          controller: _nameController,
          // 6. Define a cor do cursor.
          cursorColor: _currentColor,
          // 7. Estiliza o campo de texto usando InputDecoration.
          decoration: InputDecoration(
            // 8. Inclui uma dica para dar aos usuários um exemplo do que escrever.
            hintText: 'E.g. Apples, Banana, 1 Bag of salt',
            // 9. Personaliza a cor da borda do campo de texto
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        ),
      ],
    );
  }

  // TODO: Add buildImportanceField()
  Widget buildImportanceField() {
    // 1. Use uma Coluna para dispor os widgets verticalmente.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 2. Adicione texto.
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),

        /* 3.Adicione Wrap e espace cada widget filho com 10 pixels de distância. Enrole coloca as crianças 
          horizontalmente. Quando não há mais espaço,  ele passa para a próxima linha. */
        Wrap(
          spacing: 10.0,
          children: [
            // 4. Crie um ChoiceChip para o usuário selecionar a prioridade baixa.
            ChoiceChip(
              // 5. Defina a cor de fundo do chip selecionado para preto.
              selectedColor: Colors.black,
              // 6. Verifique se o usuário selecionou este ChoiceChip.
              selected: _importance == Importance.low,
              label: const Text(
                'low',
                style: TextStyle(color: Colors.white),
              ),
              // 7. Atualize _importance, caso o usuário tenha selecionado esta opção.
              onSelected: (selected) {
                setState(() => _importance = Importance.low);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.medium,
              label: const Text(
                'medium',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.medium);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.high,
              label: const Text(
                'high',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.high);
              },
            ),
          ],
        )
      ],
    );
  }

  // TODO: ADD buildDateField()
  Widget buildDateField(BuildContext context) {
    // 1 Adiciona uma Coluna para dispor os elementos verticalmente.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 2. Adiciona uma Linha para dispor os elementos horizontalmente.
        Row(
          // 3. Adiciona um espaço entre os elementos na linha.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 4. Adiciona o texto de data.
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            // 5. Adiciona um TextButton para confirmar o valor selecionado.
            TextButton(
              child: const Text('Select'),
              // 6. Obtém a data atual quando o usuário pressiona o botão.
              onPressed: () async {
                final currentDate = DateTime.now();

                /* 7. Apresenta o selecionador de data. Você restringe o seletor de datas e permite apenas que 
                    o usuário escolha uma data de hoje até cinco anos no futuro. */
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                // 8. Define _dueDate depois que o usuário seleciona uma data.
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        // 9. Formate a data atual e exiba-a com um Texto.
        Text('${DateFormat('yyyy-MM-dd').format(_dueDate)}'),
      ],
    );
  }

  // TODO: Add buildTimeField()
  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of Day',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                // 1. Mostra o seletor de tempo quando o usuário toca no botão Selecionar.
                final timeOfDay = await showTimePicker(
                  // 2. Define a hora inicial exibida no seletor de hora para a hora atual.
                  initialTime: TimeOfDay.now(),
                  context: context,
                );
                // 3. Depois que o usuário seleciona o widget de tempo, ele atualiza _timeOfDay.
                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
            ),
          ],
        ),
        Text('${_timeOfDay.format(context)}'),
      ],
    );
  }

  // TODO: Add buildColorPicker()
  Widget buildColorPicker(BuildContext context) {
    // 1. Adiciona um widget de Linha para o layout da seção do seletor de cores na direção horizontal.
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /* 2. Cria uma linha filha e agrupa os seguintes widgets:
        • Um Container para exibir a cor selecionada.
        • Uma SizedBox de 8 pixels de largura.
        • Um texto para exibir o título do seletor de cores. */
        Row(
          children: [
            Container(
              height: 50.0,
              width: 10.0,
              color: _currentColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
          ],
        ),
        // 3. Adiciona um TextButton.
        TextButton(
          child: const Text('Select'),
          onPressed: () {
            // 4. Mostra uma caixa de diálogo pop-up quando o usuário toca no botão.
            showDialog(
              context: context,
              builder: (context) {
                // 5. Encapsula o BlockPicker dentro do AlertDialog.
                return AlertDialog(
                  content: BlockPicker(
                    pickerColor: Colors.white,
                    // 6. Atualiza _currentColor quando o usuário seleciona uma cor.
                    onColorChanged: (color) {
                      setState(() => _currentColor = color);
                    },
                  ),
                  actions: [
                    /* 7. Adiciona um botão de ação na caixa de diálogo. Quando o usuário 
                          toca em Salvar, ele descarta a caixa de diálogo. */
                    TextButton(
                      child: const Text('Save'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  // TODO: Add buildQuantityField()
  Widget buildQuantityField() {
    // 1. Disponha seus widgets verticalmente, usando uma Coluna.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* 2. Adicione um título e os rótulos de quantidade à seção de quantidade criando uma Linha 
              que contém dois Textos. Você usa um SizedBox para separar os Textos. */
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            const SizedBox(width: 16.0),
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        // 3. Adicione um controle deslizante.
        Slider(
          // 4. Defina as cores ativas e inativas.
          inactiveColor: _currentColor.withOpacity(0.5),
          activeColor: _currentColor,

          // 5. Defina o valor atual do controle deslizante.
          value: _currentSliderValue.toDouble(),

          // 6. Defina o valor mínimo e máximo do controle deslizante.
          min: 0.0,
          max: 100.0,

          // 7. Defina como deseja que o controle deslizante seja incrementado.
          divisions: 100,

          /* 8. Defina o rótulo acima do controle deslizante. Aqui, você deseja 
              mostrar o valor atual acima do controle deslizante. */
          label: _currentSliderValue.toInt().toString(),

          // 9. Atualize _currentSliderValue quando o valor for alterado.
          onChanged: (double value) {
            setState(
              () {
                _currentSliderValue = value.toInt();
              },
            );
          },
        ),
      ],
    );
  }
}
