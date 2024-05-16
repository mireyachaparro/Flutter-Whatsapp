enum FromWho {
  me,
  other
}

class Message{
  final String text; //sale rojo, hay que seleccionar la opcion 'cretae constructor for final fields' y se crea lo de abajo
  final String? imageURL;
  final FromWho fromWho;

// se crea esto pero abajo lo vamos a modificar para ponerle el required
  // Message(this.text, this.imageURL, this.fromWho);

  Message({
    required this.text, 
    this.imageURL, 
    required this.fromWho
    });
}