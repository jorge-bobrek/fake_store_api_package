/// [RatingEntity] representa la entidad de dominio del rating de un producto.
abstract class RatingEntity {
  ///Puntaje promedio del producto
  final double? rate;
  ///Cantidad de puntuaciones del producto
  final int? count;

  RatingEntity({
    this.rate,
    this.count,
  });
}
