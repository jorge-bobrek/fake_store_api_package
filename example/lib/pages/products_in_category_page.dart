import 'package:example/pages/product_detail_page.dart';
import 'package:example/providers/product_provider.dart';
import 'package:example/widgets/product_item_widget.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsInCategoryPage extends StatefulWidget {
  const ProductsInCategoryPage({required this.category, super.key});
  final Category category;

  @override
  State<ProductsInCategoryPage> createState() => _ProductsInCategoryPageState();
}

class _ProductsInCategoryPageState extends State<ProductsInCategoryPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false)
        .fetchProductsInCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos en ${widget.category}'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return ProductItemWidget(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(productId: product.id!),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
