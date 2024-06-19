import 'package:fake_store_api_package/domain/entities/product_entity.dart';
import 'package:collection/collection.dart';

import '../../domain/utils/category_enum.dart';
import 'rating_model.dart';

/// [ProductModel] representa el modelo de datos de un producto
/// y extiende la entidad de dominio [ProductEntity].
class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
    super.rating,
  });

  /// Crea una instancia de [ProductModel] a partir de un JSON.
  factory ProductModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ProductModel();
    }
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? '',
      price: json["price"].toDouble() ?? 0.0,
      description: json["description"] ?? '',
      category: Category.values.firstWhereOrNull(
              (element) => element.name == json["category"]) ??
          Category.none,
      image: json["image"] ?? '',
      rating: json["rating"] != null
          ? RatingModel.fromJson(json["rating"])
          : RatingModel(),
    );
  }

  Map<String, dynamic>? toJson() {
    if (id == null &&
        title == null &&
        price == null &&
        description == null &&
        category == null &&
        image == null &&
        rating == null) {
      return null;
    }
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category?.name ?? Category.none,
      "image": image,
      "rating": rating?.toJson(),
    };
  }

  /// Override del método toString que permite mostrar formateada la información del producto.
  @override
  String toString() {
    return '''
ID: ${id ?? 'N/A'}
Título: ${title ?? 'N/A'}
Precio: \$${price ?? 'N/A'}
Descripción: ${description ?? 'N/A'}
Categoría: ${category?.displayName ?? 'N/A'}
Imagen: ${image ?? 'N/A'}
Rating: ${rating?.toString() ?? 'N/A'}
''';
  }
}
