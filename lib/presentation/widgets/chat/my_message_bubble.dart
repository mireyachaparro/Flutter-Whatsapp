import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {

  final Message message;

  const MyMessageBubble(
    {
      super.key,
      required this.message
    }
  );

  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme; // para el color de las burbujas: busca el tema dentro del contexto, el primero que encuentre

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            // color: colors.primary, // es el color que hemos definido como principal en main: theme -> AppTheme(selectedColor: 6).theme(),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, 
              style: const TextStyle(color: Colors.white)
            ),
          ),
        ),
        const SizedBox(height: 5) // espacio entre un elemento y otro (entre un mensaje mio y otro mio)
      ],
    );
  }
}