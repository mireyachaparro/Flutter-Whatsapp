import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{ // puede notificar cuando hay cambios y podemos redibujar ciertas cosas

  // manera 1, con el tipo de la variable
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  // manera 2, sin el tipo de la variable
  // final chatScrolotroller = ScrollController();
  // final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    // Message(text: 'holaaaa', fromWho: FromWho.me),
    // Message(text: '¿ya has llegado?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {

    if(text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if(text.endsWith('?')){
      otherReply();
    }

    notifyListeners(); // si algo ha cambiado, notifica a todos los que esten escuchando, o sea a chat_screen porque llama al provider
    moveScrollToBottom();
  }

  Future<void> otherReply() async {
    final otherMessage = await getYesNoAnswer.getAnswer();
    messageList.add(otherMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, // posicion
      duration: const Duration(milliseconds: 300), // duracion de la animacion 
      curve: Curves.easeOut // tipo de animacion (que llegue al final y rebote, que al final sea lento...)
    );
  }
}