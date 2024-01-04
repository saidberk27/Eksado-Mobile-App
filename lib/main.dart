import 'package:eksado_main/home/home_page.dart';
import 'package:flutter/material.dart';

import 'themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = 'Eksado Mobil Takip Yazılımı';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: LightTheme.theme,
        home: const HomePage());
  }
}
