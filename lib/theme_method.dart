import 'package:flutter/material.dart';
import 'package:uas/theme_manager.dart';

//implementasi abstract method
abstract class ThemeManager {
  static ThemeData craeteTheme(ITheme theme) => ThemeData(
      cardColor: theme.colors.colorScheme?.onSecondary,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(),
        labelColor: theme.colors.tabbarSelectedColor,
        unselectedLabelColor: theme.colors.tabbarNormalColor,
      ),
      appBarTheme: AppBarTheme(backgroundColor: theme.colors.appBarColor),
      scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
      colorScheme: theme.colors.colorScheme);
}
