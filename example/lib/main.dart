import 'package:example/pages/home_page.dart';
import 'package:example/providers/product_provider.dart';
import 'package:fake_store_package/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(
        catalog: Catalog(),
      ),
      child: MaterialApp(
        title: 'Tienda de Productos',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const HomePage(),
      ),
    );
  }
}
