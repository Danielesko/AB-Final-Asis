import 'package:flutter_application_1/data/mis_carritos.dart';
import 'package:flutter_application_1/models/carritoData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Ignora los errores de mayusculas en el normal
// ignore: camel_case_types
class carrito_Notifier extends StateNotifier<List<Carrito>>{
  carrito_Notifier() : super(misCarritosDePrueba);

  add(Carrito carrito) {
    state = [carrito, ...state];
  }
  delete(String id){
    state = state.where((carritoAhora) => carritoAhora.id != id).toList();
  }
  edita(Carrito carritoactualizada, String idantes){
  state = state.map((carritoAhora) {
    if (carritoAhora.id == idantes) {
      return carritoAhora.copyWith(nombre: carritoactualizada.nombre);
    }
    return carritoAhora;
  }).toList();
}

  void editaProductos(Carrito nuevoProductosCarrito, String id) {
    state = state.map((carritoAhora) {
      if (carritoAhora.id == id) {
        return carritoAhora.copyWith(productos: nuevoProductosCarrito.productos);
      }
      return carritoAhora;
    }).toList();
  }
}
final carritosProvider = StateNotifierProvider<carrito_Notifier, List<Carrito>>(
  (ref) => carrito_Notifier(),
);