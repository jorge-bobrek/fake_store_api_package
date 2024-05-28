import 'package:dartz/dartz.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:fake_store_package/domain/repositories/interfaces/product_repository.dart';

/// Caso de uso para obtener un producto específico por ID.
class GetProduct {
  final IProductRepository repository;

  GetProduct(this.repository);

  Future<Either<ProductEntity, String>> call(int id) {
    return repository.getProduct(id);
  }
}
