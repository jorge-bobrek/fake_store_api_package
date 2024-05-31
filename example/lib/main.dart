import 'package:example/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tienda de Productos',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
      home: const HomePage(),
    );
  }
}
