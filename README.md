
# Fake Store

Un simple paquete que consume los servicios del [Fake Store API](https://fakestoreapi.com/) para ser usado desde Flutter.

## Uso del paquete

Para hacer uso del paquete primero hay que agregarlo a las dependencias con el nombre de `fake_store_package`

Para consultar los servicios debemos importar la clase Catalog
```
import 'package:fake_store_package/catalog.dart';
```
Después se crea una instancia de la clase **Catalog**.
```
final catalog = Catalog();
```
Con esta instancia podemos llamar a los diferentes casos de uso.
```
final product = await catalog.getProduct(7);
```
Y procesar la respuesta haciendo uso de *fold*, recibiendo primero el objeto de respuesta del servicio y de segundo el error.
```
product.fold(
  (product) => printProduct(product),
  (error) => print(error),
);
  ```

Actualmente el proyecto consume los siguientes 3 servicios del API:

### GetProductsList: 
Retorna la información de todos los productos disponibles en el API.\
Se puede acceder a este servicio por medio de `catalog.getProductsList()`.\
Este método llama a la url: https://fakestoreapi.com/products

### GetProduct: 
Retorna la información de un producto individual consultándolo por medio del **id** del producto.\
Se puede acceder a este servicio por medio de `catalog.getProduct(id)` y el servicio responderá con la información del producto solicitado.\
Este método llama a la url: https://fakestoreapi.com/products/{id}

### GetProductsInCategory: 
Retorna la información de todos los productos ubicados en la **cateogría** especificada.\
Se puede acceder a este servicio por medio de `catalog.getProductsInCategory(Category)`, en el cual **Category** es un Enum de categorías, y responderá con un listado de productos de la categoría seleccionada.\
Este método llama a la url: https://fakestoreapi.com/products/category/{category}
