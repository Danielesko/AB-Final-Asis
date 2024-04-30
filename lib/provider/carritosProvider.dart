import 'package:flutter_application_1/data/mis_carritos.dart';
import 'package:flutter_application_1/models/carritoData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class carrito_Notifier extends StateNotifier<List<Carrito>>{
  carrito_Notifier() : super(misCarritosDePrueba);
  delete(String id){
    state = state.where((carritoAhora) => carritoAhora.id != id).toList();
  }
  edita(Carrito carrito, String nombre){
    state = state.map((carritoAhora) {
      if (carritoAhora.nombre == carrito.nombre) {
        return carrito;
      }
      return carritoAhora;
    }).toList();
  }
}
final carritosProvider = StateNotifierProvider<carrito_Notifier, List<Carrito>>(
  (ref) => carrito_Notifier(),
);