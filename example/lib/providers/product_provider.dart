import 'package:fake_store_package/catalog.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final Catalog catalog;

  String _response = "";
  String get response => _response;

  ProductProvider({required this.catalog});

  Future<void> fetchProducts() async {
    final result = await catalog.getProductsList();
    result.fold(
      (productList) {
        _response = productList.map((p) => p.toString()).join('\n');
        notifyListeners();
      },
      (failure) {
        _response = "Error: $failure";
        notifyListeners();
      },
    );
  }

  Future<void> fetchProduct(int id) async {
    final result = await catalog.getProduct(id);
    result.fold(
      (product) {
        _response = product.toString();
        notifyListeners();
      },
      (failure) {
        _response = "Error: $failure";
        notifyListeners();
      },
    );
  }

  Future<void> fetchProductsInCategory(Category category) async {
    notifyListeners();

    if (category == Category.none) {
      fetchProducts();
    } else {
      final result = await catalog.getProductsInCategory(category);
      result.fold(
        (productList) {
          _response = productList.map((p) => p.toString()).join('\n');
          notifyListeners();
        },
        (failure) {
          _response = "Error: $failure";
          notifyListeners();
        },
      );
    }
  }
}
