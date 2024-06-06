import 'package:fake_store_package/data/models/rating_model.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';

/// [ProductEntity] representa la entidad de dominio de un producto.
abstract class ProductEntity {
  ///Id del producto
  final int? id;
  ///Título del producto
  final String? title;
  ///Descripción del producto
  final String? description;
  ///Precio del producto
  final double? price;
  ///Categoría del producto
  final Category? category;
  ///URL de la imagen del producto
  final String? image;
  ///Puntaje del producto
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
