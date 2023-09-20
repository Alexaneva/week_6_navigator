import 'package:flutter/material.dart';
import 'Pages/main_screen.dart';
import 'Pages/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MainScreen(), routes: {
      '/DetailScreen': (context) => const DetailScreen(),
    });
  }
}
