import 'package:fake_store_package/domain/entities/rating_entity.dart';

/// [RatingModel] representa el modelo de datos del rating de un producto
/// y extiende la entidad de dominio [RatingEntity].
class RatingModel extends RatingEntity {
  RatingModel({
    super.rate,
    super.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return RatingModel();
    }
    return RatingModel(
      rate: json["rate"].toDouble() ?? 0.0,
      count: json["count"] ?? 0,
    );
  }

  Map<String, dynamic>? toJson() {
    if (rate == null && count == null) {
      return null;
    }
    return {
      'rate': rate,
      'count': count,
    };
  }
  
  @override
  String toString() {
    return 'Puntaje: ${rate?.toStringAsFixed(1) ?? 'N/A'}, Puntuaciones: ${count ?? 'N/A'}';
  }
}
