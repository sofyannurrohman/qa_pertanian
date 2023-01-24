import 'package:flutter/material.dart';

import 'theme_abstaract.dart';

//abstrak getter untuk mendapatkan IColors
abstract class ITheme {
  IColors get colors;
}

//abstract
abstract class ThemeManager {
  static ThemeData craeteTheme(ITheme theme) => ThemeData(
      cardColor: theme.colors.colorScheme?.onSecondary,
      scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
      colorScheme: theme.colors.colorScheme);
}
