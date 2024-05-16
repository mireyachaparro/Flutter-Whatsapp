// class YesNoModel{
//   String answer;
//   bool forced;
//   String image;

//   YesNoModel(
//     {
//       required this.answer,
//       required this.forced,
//       required this.image
//     }
//   );

//   // crear instancia de YesNoModel
//   // factory: crear nueva instancia
//   // fromJsonMap: crear nuevo constructor en el que recibimos un mapa
//   factory YesNoModel.fromJsonMap(Map<String, dynamic>json) => 
//     YesNoModel(
//       answer: json['answer'], 
//       forced: json['forced'], 
//       image: json['image']
//     );
// }

// esto es una forma mas facil
// https://app.quicktype.io/
// abrir quicktype
// lenguaje dart, null safety, todas las propiedades como null
// abrir postman, copiar respuesta, pegar en quicktype en la parte de la izquierda y cambiar el nombre del modelo
// copiar el codigo que nos da y pegarlo aqui

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJsonMap(json.decode(str));

String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity() => 
      Message(
        text: answer == 'yes' ? 'Sí' : 'No',
        fromWho: FromWho.other,
        imageURL: image
      );
}
