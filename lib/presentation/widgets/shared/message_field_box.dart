import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController(); // nos va a dar el control del input al que lo vamos a asociar

    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: (){
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          }, 
          icon: const Icon(Icons.send_outlined)
        )
      );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      }, // si hago clic fuera del input, se cierra el teclado
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        textController.clear();
        focusNode.requestFocus(); // si le das a done el teclado sigue levantado
        onValue(value);
      },
    );
  }
}