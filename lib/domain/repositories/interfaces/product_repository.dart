import 'package:dartz/dartz.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';

/// Interfaz que expone los métodos del repositorio de productos:
/// * getProductsList()
/// * getProduct(int id)
/// * getProductsInCategory(Category category)
abstract interface class IProductRepository {
  Future<Either<List<ProductEntity>, String>> getProductsList();
  Future<Either<ProductEntity, String>> getProduct(int id);
  Future<Either<List<ProductEntity>, String>> getProductsInCategory(
      Category category);
}
