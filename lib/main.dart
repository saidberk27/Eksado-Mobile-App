import 'package:eksado_main/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'signin/sign_in_page.dart';
import 'themes/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
