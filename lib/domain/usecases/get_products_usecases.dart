import 'package:dartz/dartz.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:fake_store_package/domain/repositories/interfaces/product_repository.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';

/// Casos de uso para obtener los productos.
class GetProducts {
  final IProductRepository repository;

  GetProducts(this.repository);

  /// Obtiene la lista de productos desde la API.
  Future<Either<List<ProductEntity>, String>> getProductsList() {
    return repository.getProductsList();
  }

  /// Obtiene un producto por su [id] desde la API.
  Future<Either<ProductEntity, String>> getProduct(int id) {
    return repository.getProduct(id);
  }

  /// Obtiene productos en una categoría específica desde la API.
  Future<Either<List<ProductEntity>, String>> getProductsInCategory(
      Category category) {
    return repository.getProductsInCategory(category);
  }
}
