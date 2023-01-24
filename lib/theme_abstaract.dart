import 'package:flutter/material.dart';

//abstract class IColors template medeklarasikan data secara general yang akan dibuat theme

abstract class IColors {
  Color scaffoldBackgroundColor;
  Color appBarColor;
  Color tabBarColor;
  Color tabbarSelectedColor;
  Color tabbarNormalColor;
  Brightness brightness;

  ColorScheme colorScheme;
}
