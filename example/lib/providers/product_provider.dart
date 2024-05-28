import 'package:fake_store_package/catalog.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final Catalog catalog;

  List<ProductEntity> products = [];
  ProductEntity? selectedProduct;
  Category selectedCategory = Category.none;
  String? errorMessage;

  ProductProvider({required this.catalog});

  Future<void> fetchProducts() async {
    products = [];
    final result = await catalog.getProductsList();
    result.fold(
      (productList) {
        products = productList;
        notifyListeners();
      },
      (failure) {
        errorMessage = 'Error al cargar los productos';
        notifyListeners();
      },
    );
  }

  Future<void> fetchProduct(int id) async {
    selectedProduct = null;
    final result = await catalog.getProduct(id);
    result.fold(
      (product) {
        selectedProduct = product;
        notifyListeners();
      },
      (failure) {
        errorMessage = 'Error al cargar el producto';
        notifyListeners();
      },
    );
  }

  Future<void> fetchProductsInCategory(Category category) async {
    products = [];
    selectedCategory = category;
    notifyListeners();

    if (category == Category.none) {
      fetchProducts();
    } else {
      final result = await catalog.getProductsInCategory(category);
      result.fold(
        (productList) {
          products = productList;
          notifyListeners();
        },
        (failure) {
          errorMessage = 'Error al cargar los productos en la categoría';
          notifyListeners();
        },
      );
    }
  }
}
