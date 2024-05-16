import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    // en response.data tengo un mapa que es asi:
    // tengo algo del tipo string, dynamic que se llama data, y dentro trae un answer, forced y la image
    // Map<String, dynamic>data = {
    //   'answer': 'yes',
    //   'forced': 'true',
    //   'image': 'https://asd/asdasd',
    // };
    // si escribo mal esto no me lo va a decir y va devolver null y errores inesperados
    // data['anmswerrr']

    // el objetivo de este modelo es que me ayude a trabajar con una implementacion de la respuesta del api, 
    // si el api cambia, se donde tengo que cambiarlo, solo en el yesnomodel

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
