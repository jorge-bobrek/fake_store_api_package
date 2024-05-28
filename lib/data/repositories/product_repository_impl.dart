import 'package:dartz/dartz.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:fake_store_package/data/sources/product_remote_data_source.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:fake_store_package/domain/repositories/interfaces/product_repository.dart';

/// Implementación del repositorio [ProductRepository] que maneja la
/// lógica de acceso a datos para los productos.
class ProductRepositoryImpl implements IProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<List<ProductEntity>, String>> getProductsList() {
    return remoteDataSource.getProductsList();
  }

  @override
  Future<Either<ProductEntity, String>> getProduct(int id) {
    return remoteDataSource.getProduct(id);
  }

  @override
  Future<Either<List<ProductEntity>, String>> getProductsInCategory(
      Category category) {
    return remoteDataSource.getProductsInCategory(category);
  }
}
