import 'package:flutter/material.dart';

const labelTextSize = 20.0;
String defaultFontName = "Roboto";
const defaultFontWeight = FontWeight.w300;

final theme = ThemeData(
  fontFamily: defaultFontName,
  colorSchemeSeed: Colors.blueGrey[800],
  brightness: Brightness.light,
  useMaterial3: true,
);

final darkTheme = ThemeData(
  fontFamily: defaultFontName,
  colorSchemeSeed: Colors.indigo,
  brightness: Brightness.dark,
  useMaterial3: true,
);