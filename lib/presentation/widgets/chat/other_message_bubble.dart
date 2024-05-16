import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class OtherMessageBubble extends StatelessWidget {
  final Message message;

  const OtherMessageBubble(
    {
      super.key, 
      required this.message
    }
  );

  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme; // para el color de las burbujas: busca el tema dentro del contexto, el primero que encuentre

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            // color: colors.primary, // es el color que hemos definido como principal en main: theme -> AppTheme(selectedColor: 6).theme(),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5), // espacio entre un elemento y otro

        _ImageBubble(message.imageURL!),

        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  // const _ImageBubble({super.key}); // no lo necesitamos

  final String imageURL;

  const _ImageBubble( this.imageURL);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; 
    // media query nos va a dar informacion referente al dispositivo que lo esta ejecutando. 
    // el context hace referencia al arbol de widgets y entre esa informacion que esta en ese arbol de widgets tambien estan las dimensiones
    // y caracteristicas del dispositivo que lo esta corriendo (.size es que quiero el size del dispositivo)

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageURL,
        width: size.width*0.7,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress){
          if(loadingProgress == null) return child;
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 228, 228, 228)
            ),
            width: size.width * 0.7,
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                :null
              ),
            ),
          );
        },
      )
    ); //ClipRRect nos permite hacer bordes redondeados
  }
}