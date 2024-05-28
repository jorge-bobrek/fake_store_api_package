import 'package:dartz/dartz.dart';
import 'package:fake_store_package/data/repositories/product_repository_impl.dart';
import 'package:fake_store_package/data/sources/product_remote_data_source.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';

class Catalog {
  final repository = ProductRepositoryImpl(ProductRemoteDataSource());

  /// Obtiene la lista de productos desde la API.
  Future<Either<List<ProductEntity>, String>> getProductsList() async =>
      repository.getProductsList();

  /// Obtiene un producto específico por [id] desde la API.
  Future<Either<ProductEntity, String>> getProduct(int id) async =>
      repository.getProduct(id);

  /// Obtiene la lista de productos en una [category] específica desde la API.
  Future<Either<List<ProductEntity>, String>> getProductsInCategory(
          Category category) async =>
      repository.getProductsInCategory(category);
}
