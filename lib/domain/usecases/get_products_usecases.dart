import 'package:dartz/dartz.dart';
import 'package:fake_store_api_package/domain/entities/product_entity.dart';
import 'package:fake_store_api_package/domain/repositories/interfaces/product_repository.dart';
import 'package:fake_store_api_package/domain/utils/category_enum.dart';

/// Casos de uso para obtener los productos.
class GetProducts {
  final IProductRepository repository;

  GetProducts(this.repository);

  /// Obtiene la lista de productos desde la API.
  /// 
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda una lista de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<List<ProductEntity>, String>> getProductsList() {
    return repository.getProductsList();
  }

  /// Obtiene un producto por su [id] desde la API.
  /// 
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda un objeto de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<ProductEntity, String>> getProduct(int id) {
    return repository.getProduct(id);
  }

  /// Obtiene la lista de productos en una [category] específica desde la API.
  /// 
  /// Retorna un valor [Future] de tipo [Either] que contiene unos valores a
  /// la izquierda una lista de tipo [ProductEntity] que contiene la respuesta
  /// y a la derecha un [String] que contiene el error.
  Future<Either<List<ProductEntity>, String>> getProductsInCategory(
      Category category) {
    return repository.getProductsInCategory(category);
  }
}
