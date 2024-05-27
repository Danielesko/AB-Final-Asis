import 'package:uuid/uuid.dart';

const uuid = Uuid();
class Carrito {
  
  String id;
  String nombre;
  String? productos; // Hace que los productos sean opcionales
  double? precio; // Hace que el precio sea opcional

  Carrito({required this.nombre, this.productos, this.precio}) : id = uuid.v4();

  //esta función crea una copia del objeto actual, pero con la posibilidad de reemplazar algunos de los campos con nuevos valores.
  Carrito copyWith({String? nombre, String? productos, double? precio}) {
    return Carrito(
      nombre: nombre ?? this.nombre,
      productos: productos ?? this.productos,
      precio: precio ?? this.precio,
    );
  }
  
}
