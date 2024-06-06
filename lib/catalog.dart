import 'package:dartz/dartz.dart';
import 'package:fake_store_package/data/repositories/product_repository_impl.dart';
import 'package:fake_store_package/data/sources/product_remote_data_source.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';

/// Clase que hace uso del repositorio de productos con 3 métodos para acceder a
/// cada uno de las implementaciones y retornar la respuesta del servicio:
/// * getProductsList(), que retorna Future<Either<List<ProductEntity>, String>>
/// * getProduct(int id), que retorna Future<Either<ProductEntity, String>>
/// * getProductsInCategory(Category category), que retorna Future<Either<List<ProductEntity>, String>>
class Catalog {
  final repository = ProductRepositoryImpl(ProductRemoteDataSource());

  /// Obtiene la lista de productos desde la API.
  ///
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda una lista de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<List<ProductEntity>, String>> getProductsList() async =>
      repository.getProductsList();

  /// Obtiene un producto específico por [id] desde la API.
  ///
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda un objeto de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<ProductEntity, String>> getProduct(int id) async =>
      repository.getProduct(id);

  /// Obtiene la lista de productos en una [category] específica desde la API.
  ///
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda una lista de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<List<ProductEntity>, String>> getProductsInCategory(
          Category category) async =>
      repository.getProductsInCategory(category);
}
