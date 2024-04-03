import 'package:flutter/material.dart';

const colorList = <Color>  [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor; 

  AppTheme({this.selectedColor = 0}): assert(selectedColor >= 0 && selectedColor < colorList.length);

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    )
  );
}