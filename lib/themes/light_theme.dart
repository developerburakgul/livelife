import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// final ThemeData lightTheme = ThemeData(
//   brightness: Brightness.light,
// primarySwatch: Colors.cyan,
//   colorScheme: ColorScheme.light(
// primary: Color.fromARGB(255, 243, 201, 33),
// secondary: const Color.fromARGB(255, 255, 7, 243),
//   ),
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   appBarTheme: AppBarTheme(
// color: const Color.fromARGB(255, 178, 209, 233),
//   ),
//   // Diğer light theme özelleştirmeleri
// );
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: colorFromHex('#7985d4')!,
secondary: colorFromHex('#8b95d8')!,
tertiary: colorFromHex('#937eb0')!),
  primaryColorLight: Colors.black54,
  appBarTheme: AppBarTheme(color: colorFromHex('#7985d4')),
  // Diğer aydınlık tema ayarları burada...
);
