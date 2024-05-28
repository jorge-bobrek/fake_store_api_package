import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:fake_store_package/data/models/product_model.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dartz/dartz.dart';

/// [ProductRemoteDataSource] maneja las llamadas a la API remota
/// para obtener datos de productos.
class ProductRemoteDataSource {
  Future<Either<List<ProductEntity>, String>> getProductsList() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    return _fetchData(
        url,
        (data) =>
            List<ProductEntity>.from(
            data.map((x) => ProductModel.fromJson(x))));
  }

  Future<Either<ProductEntity, String>> getProduct(int id) async {
    final url = Uri.parse('https://fakestoreapi.com/products/$id');
    return _fetchData(url, (data) => ProductModel.fromJson(data));
  }

  Future<Either<List<ProductEntity>, String>> getProductsInCategory(
      Category category) async {
    final url = Uri.parse(
        'https://fakestoreapi.com/products/category/${category.name}');
    return _fetchData(
        url,
        (data) =>
            List<ProductEntity>.from(
            data.map((x) => ProductModel.fromJson(x))));
  }

  /// Método genérico para realizar la solicitud a la API y manejar la respuesta.
  Future<Either<T, String>> _fetchData<T>(
      Uri url, T Function(dynamic) fromJson) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Left(fromJson(json.decode(response.body)));
      } else {
        return Right(response.body);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
