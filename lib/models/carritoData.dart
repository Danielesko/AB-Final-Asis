import 'package:uuid/uuid.dart';

const uuid = Uuid();
class Carrito {
  
  String id;
  String nombre;
  String? productos;
  double? precio; // Hace que el precio sea opcional

  Carrito({required this.nombre, this.productos, this.precio}) : id = uuid.v4();
  Carrito copyWith({String? nombre, String? productos, double? precio}) {
    return Carrito(
      nombre: nombre ?? this.nombre,
      productos: productos ?? this.productos,
      precio: precio ?? this.precio,
    );
  }
  
}
