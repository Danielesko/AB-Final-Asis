import 'package:uuid/uuid.dart';

const uuid = Uuid();
class Carrito {
  
  String id;
  String nombre;
  String productos;
  double? precio; // Hace que el precio sea opcional

  Carrito({required this.nombre, required this.productos, this.precio}) : id = uuid.v4();

}
