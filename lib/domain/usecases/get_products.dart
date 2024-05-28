import 'package:dartz/dartz.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:fake_store_package/domain/repositories/interfaces/product_repository.dart';

/// Caso de uso para obtener la lista de productos.
class GetProducts {
  final IProductRepository repository;

  GetProducts(this.repository);

  Future<Either<List<ProductEntity>, String>> call() {
    return repository.getProductsList();
  }
}
