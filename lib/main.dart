import 'package:flutter/material.dart';

import 'themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eksado Mobil Takip Yazılımı',
      theme: LightTheme.theme,
      home: Scaffold(
        appBar: AppBar(title: const Text("aa")),
      ),
    );
  }
}
