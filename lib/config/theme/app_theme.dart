import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colorList.length);

  ThemeData getTheme() => ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => 
  AppTheme(selectedColor: selectedColor ?? this.selectedColor, 
  isDarkMode: isDarkMode ?? this.isDarkMode);
}
