import 'package:flutter/material.dart';
import 'package:uas/home.dart';
import 'package:uas/theme_method.dart';

import 'light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

//inheritance
class MyApp extends StatelessWidget {
  //polimorphism Widget build mengmbalikan Material app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz  App',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.craeteTheme(AppThemeLight()),
      home: Home(),
    );
  }
}
