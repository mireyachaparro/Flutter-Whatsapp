
import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 109, 109, 194);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme{

  final int selectedColor; // da error, solucionar, añadir constructor y se añade la linea de abajo

  AppTheme({
    // required this.selectedColor
    this.selectedColor = 0
    }): assert (selectedColor >= 0 && selectedColor <= _colorThemes.length-1 , 'Colors must be between 0 and ${_colorThemes.length-1}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      // colorSchemeSeed: _colorThemes[6] //el 0 es el que hemos puesto nosotros por defecto que es el Color.fromARGB(0, 109, 109, 194); // el 1 es el azul // si pongo 7 da error y hay que recargar el debug
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark // para tema oscuro
    );
  }
}