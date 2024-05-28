import 'package:fake_store_package/data/models/rating_model.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';

/// [ProductEntity] representa la entidad de dominio de un producto.
abstract class ProductEntity {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final Category? category;
  final String? image;
  final RatingModel? rating;

  ProductEntity({
    this.id,
    this.title,
    this.description,
    this.price,
    this.category,
    this.image,
    this.rating
  });
}
