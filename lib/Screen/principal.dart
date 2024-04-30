import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/carritoEditScreen.dart';
import 'package:flutter_application_1/models/carritoData.dart';
import 'package:flutter_application_1/provider/carritosProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'carritoScreen.dart';

class Sesion extends ConsumerStatefulWidget {
  const Sesion({super.key});

  @override
  ConsumerState<Sesion> createState() => _SesionState();
}

class _SesionState extends ConsumerState<Sesion> {
  @override
  Widget build(BuildContext context) {
    final listaCarritos = ref.watch(carritosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carritos'),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) => Card(
                child: ListTile(
                  title: Text(
                    listaCarritos[index].nombre,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () => delete(listaCarritos[index].id),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () => edita(context, listaCarritos[index]),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          itemCount: listaCarritos.length),
    );
  }

  void edita(BuildContext context, Carrito carritoSeleccionado) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => carritoEditScreen(carrito: carritoSeleccionado)));
  }

  void delete(String id) {
    ref.read(carritosProvider.notifier).delete(id);
  }
}
