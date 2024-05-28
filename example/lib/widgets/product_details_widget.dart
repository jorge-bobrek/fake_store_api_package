import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title!,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '\$${product.price!.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Categoría:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            product.category!.name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Descripción:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            product.description!,
            style: const TextStyle(
              fontSize: 18,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          if (product.rating != null) ...[
            const Text(
              'Valoración:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 24),
                const SizedBox(width: 5),
                Text(
                  product.rating!.rate.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '(${product.rating!.count} opiniones)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
