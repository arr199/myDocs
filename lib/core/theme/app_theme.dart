import 'package:flutter/material.dart';

const List _colors = [
  Color.fromARGB(255, 3, 29, 148),
  Color.fromARGB(255, 110, 186, 248),
  Colors.red,
  Colors.blue,
  Colors.green,
  Color.fromARGB(255, 143, 236, 146),
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(
          selectedColor >= 0 && selectedColor < _colors.length,
          "Select a color between 0 and ${_colors.length - 1}",
        );
  
  ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      colorSchemeSeed: _colors[selectedColor],
      appBarTheme: AppBarTheme(
        backgroundColor: _colors[selectedColor],
      ),
    );
  }
}