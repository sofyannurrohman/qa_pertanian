import 'package:uas/theme_abstaract.dart';

import 'light_colors.dart';
import 'theme_manager.dart';

class AppThemeLight extends ITheme {
  // override ini juga salah satu bentuk dari implementasi dari polymorphism
  @override
  IColors get colors => LightColors();
}
