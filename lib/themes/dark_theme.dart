import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey[850]!,
    primary: colorFromHex('#392465')!,
    secondary: Colors.white,
    tertiary: colorFromHex('#51286a')!,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    color: Colors.grey[900]!,
  ),
  // Diğer dark theme özelleştirmeleri
);
