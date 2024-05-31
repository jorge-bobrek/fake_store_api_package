/// [RatingEntity] representa la entidad de dominio del rating de un producto.
abstract class RatingEntity {
  final double? rate;
  final int? count;

  RatingEntity({
    this.rate,
    this.count,
  });
}
