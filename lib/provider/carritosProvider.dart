import 'package:flutter_application_1/data/mis_carritos.dart';
import 'package:flutter_application_1/models/carritoData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class carrito_Notifier extends StateNotifier<List<Carrito>>{
  carrito_Notifier() : super(misCarritosDePrueba);
}
final carritosProvider = StateNotifierProvider<carrito_Notifier, List<Carrito>>(
  (ref) => carrito_Notifier(),
);