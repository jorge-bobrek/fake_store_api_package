import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example/providers/product_provider.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda de Productos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    provider.fetchProducts();
                  },
                  child: const Text("Lista de Productos"),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.fetchProduct(10);
                  },
                  child: const Text("Producto"),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.fetchProductsInCategory(Category.electronics);
                  },
                  child: const Text("Productos por Categoría"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(provider.response),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
