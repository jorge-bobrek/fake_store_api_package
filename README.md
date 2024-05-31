
# Fake Store

Un simple paquete que consume los servicios del [Fake Store API](https://fakestoreapi.com/) para ser usado desde Flutter.

## Uso del paquete

Para hacer uso del paquete primero hay que agregarlo a las dependencias con el nombre de `fake_store_package`

Para consultar los servicios debemos importar la clase Catalog
```dart
import 'package:fake_store_package/catalog.dart';
```
Después se crea una instancia de la clase **Catalog**.
```dart
final catalog = Catalog();
```
Con esta instancia podemos llamar a los diferentes casos de uso.
```dart
final product = await catalog.getProduct(7);
```
Y procesar la respuesta haciendo uso de *fold*, recibiendo primero el objeto de respuesta del servicio y de segundo el error.
```dart
product.fold(
  (product) => printProduct(product),
  (error) => print(error),
);
```
En el proyecto se cuenta con un ejemplo consumiendo los 3 servicios disponibles actualmente, cada uno luce de la siguiente manera:
```dart
final result = await catalog.getProductsList();
setState(() {
  _response = result.fold(
    (products) => products
        .map((product) => product.toString())
        .join('\n\n'),
    (error) => 'Error: $error',
  );
});
  ```
Donde `_response` será mostrado en un campo de texto en la pantalla. Para estos ejemplos se hace uso del método `toString()` para visualizar correctamente la información del producto en formato de texto.

#### Actualmente el proyecto consume los siguientes 3 servicios del API:

### GetProductsList: 
Retorna la información de todos los productos disponibles en el API.\
Se puede acceder a este servicio por medio de `catalog.getProductsList()`, el cual retorna un objeto `Future<Either<List<ProductEntity>, String>>`.\
Este método llama a la url: https://fakestoreapi.com/products

### GetProduct: 
Retorna la información de un producto individual consultándolo por medio del **id** del producto.\
Se puede acceder a este servicio por medio de `catalog.getProduct(id)` y el servicio responderá con la información del producto solicitado en el objeto `Future<Either<ProductEntity, String>>, String>>`.\
Este método llama a la url: https://fakestoreapi.com/products/{id}

### GetProductsInCategory: 
Retorna la información de todos los productos ubicados en la **cateogría** especificada.\
Se puede acceder a este servicio por medio de `catalog.getProductsInCategory(Category)`, en el cual **Category** es un Enum de categorías, y responderá con un listado de productos de la categoría seleccionada en el objeto `Future<Either<List<ProductEntity>, String>>`.\
Este método llama a la url: https://fakestoreapi.com/products/category/{category}

## Modelos de datos

#### ProductEntity

Este modelo es el objeto principal que retorna los diferentes servicios.
```dart
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
```

#### RatingEntity

Este modelo hace parte del modelo del producto y representa la calificación de un producto.
```dart
abstract class RatingEntity {
  final double? rate;
  final int? count;

  RatingEntity({
    this.rate,
    this.count,
  });
}

```

#### Category

Adicionalmente se cuenta con un Enum para las categorías.
```dart
enum Category {
  none,
  electronics,
  jewelery,
  mensClothing,
  womensClothing,
}
```