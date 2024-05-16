// poner impm y darle a enter
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/other_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

// poner stlesw y darle enter
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1741818191507046400/M-fQcelp_400x400.jpg'),
          ),
        ),
        title: const Text('Juan de Dios'),
      ),
      // poner body: Container(), control punto en container, extraer widget
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  // const _chatView({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    /* antes
    return Column(
      children: [
        Expanded(child: Container(
          color: Colors.pink,
        )),
        Text('mundo')
      ],
    );
    
    en Column, control punto, wrap with widget */
    return SafeArea( // safeArea es para que lo de controlar la pantalla con lo de abajo (lo que arrastramos hacia arriba) no nos ocupe espacio
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length, // si no ponemos esto, es un bucle infinito
                itemBuilder: (context, index){
                  // return (index % 2 == 0)
                  //   ? const OtherMessageBubble()
                  //   : const MyMessageBubble();
                  
                  //// const MyMessageBubble();

                  final message = chatProvider.messageList[index];
                  message.imageURL; // que no puede ser null
                  return (message.fromWho == FromWho.other)
                    ? OtherMessageBubble(message: message)
                    : MyMessageBubble(message: message);
                }
              )
            ),
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}

//minuto 5