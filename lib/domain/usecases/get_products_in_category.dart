import 'package:dartz/dartz.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:fake_store_package/domain/entities/product_entity.dart';
import 'package:fake_store_package/domain/repositories/interfaces/product_repository.dart';

/// Caso de uso para obtener la lista de productos en una categoría específica.
class GetProductsInCategory {
  final IProductRepository repository;

  GetProductsInCategory(this.repository);

  Future<Either<List<ProductEntity>, String>> call(Category category) {
    return repository.getProductsInCategory(category);
  }
}
