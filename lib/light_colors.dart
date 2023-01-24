import 'package:flutter/material.dart';

import 'theme_abstaract.dart';

// Class LightColors merupakan sub class yang ingin mengakses abstract class IColors harus menggunakan implements
class LightColors implements IColors {
  //mengoveride method dari abstract class IColors agar memiliki implementasi yang berbeda dari parent IColors
  // override ini juga salah satu bentuk dari implementasi dari polymorphism
  @override
  ColorScheme colorScheme;
  @override
  Color appBarColor;

  @override
  Color scaffoldBackgroundColor;

  @override
  Color tabBarColor;

  @override
  Color tabbarNormalColor;

  @override
  Color tabbarSelectedColor;

  LightColors() {
    appBarColor = Color(0xFF395144);
    scaffoldBackgroundColor = Color(0xFF473C33);
    tabBarColor = Colors.green;
    colorScheme = ColorScheme.light()
        .copyWith(onPrimary: Colors.white, onSecondary: Colors.white);
    brightness = Brightness.light;
  }

  @override
  Brightness brightness;
}
