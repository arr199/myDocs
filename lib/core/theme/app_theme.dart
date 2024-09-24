import 'package:flutter/material.dart';
import 'package:my_docs/core/theme/constants.dart';



class AppThemeProvider extends ChangeNotifier {
  int selectedColor;

  AppThemeProvider({this.selectedColor = 0})
      : assert(
          selectedColor >= 0 && selectedColor < themeColors.length,
          "Select a color between 0 and ${themeColors.length - 1}",
        );

  ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      colorSchemeSeed: themeColors[selectedColor],
      appBarTheme: AppBarTheme(
        backgroundColor: themeColors[selectedColor],
      ),
    );
  }

  void changeColor(int color) {
    selectedColor = color;
    notifyListeners();
  }
}
