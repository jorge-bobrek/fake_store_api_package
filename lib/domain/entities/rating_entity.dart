abstract class RatingEntity {
  final double? rate;
  final int? count;

  /// [RatingEntity] representa la entidad de dominio del rating de un producto.
  RatingEntity({
    this.rate,
    this.count,
  });
}
