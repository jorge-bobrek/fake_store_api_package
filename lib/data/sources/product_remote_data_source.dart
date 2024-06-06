import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:fake_store_package/data/models/product_model.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dartz/dartz.dart';

/// [ProductRemoteDataSource] maneja las llamadas a la API remota
/// para obtener datos de productos.
class ProductRemoteDataSource {
  static const _baseUrl = 'https://fakestoreapi.com/products';

  /// Obtiene la lista de productos desde la API.
  /// 
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda una lista de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<List<ProductEntity>, String>> getProductsList() async {
    final url = Uri.parse(_baseUrl);
    return _fetchData(
        url,
        (data) =>
            List<ProductEntity>.from(
            data.map((x) => ProductModel.fromJson(x))));
  }

  /// Obtiene un producto por su [id] desde la API.
  /// 
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda un objeto de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<ProductEntity, String>> getProduct(int id) async {
    final url = Uri.parse('$_baseUrl/$id');
    return _fetchData(url, (data) => ProductModel.fromJson(data));
  }

  /// Obtiene la lista de productos en una [category] específica desde la API.
  /// 
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda una lista de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<List<ProductEntity>, String>> getProductsInCategory(
      Category category) async {
    final url = Uri.parse(
        '$_baseUrl/category/${category.name}');
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
