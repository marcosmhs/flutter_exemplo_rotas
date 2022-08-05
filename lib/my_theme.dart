import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData get myTheme {
    return ThemeData(
      primaryColor: Colors.red,
      // definição da cor primária (primarySwatch) e secundária (secundary))
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.amber),
      // fonte principal
      fontFamily: 'Raleway',
      // cor de fundo
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      // criação de tema para texto
      textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            subtitle2: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w300,
            ),
          ),
    );
  }
}
