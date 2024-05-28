import 'package:example/pages/product_detail_page.dart';
import 'package:example/providers/product_provider.dart';
import 'package:example/widgets/category_dropdown_widget.dart';
import 'package:example/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CategoryDropdownWidget(
                  selectedCategory: provider.selectedCategory,
                  onChanged: (category) {
                    provider.fetchProductsInCategory(category!);
                  },
                ),
              ),
              provider.products.isEmpty
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Expanded(
                      child: provider.errorMessage != null
                          ? Center(child: Text(provider.errorMessage!))
                          : ListView.builder(
                              itemCount: provider.products.length,
                              itemBuilder: (context, index) {
                                final product = provider.products[index];
                                return ProductItemWidget(
                                  product: product,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetailPage(
                                            productId: product.id!),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
