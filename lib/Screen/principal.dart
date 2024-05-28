import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/carritoAddScreen.dart';
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
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10),
            const Text('Carritos'),
          ],
        ),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 1.0, 
        ),
        itemBuilder: (ctx, index) => Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(.0),
          ),
          child: ListTile(
            title: Text(
              listaCarritos[index].nombre,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () => delete(listaCarritos[index].id),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => edita(context, listaCarritos[index]),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            onTap: () => mostrarCarrito(context, listaCarritos[index]),
          ),
        ),
        itemCount: listaCarritos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => add(context),
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }

  void add(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const carritoAddScreen()));
  }

  void edita(BuildContext context, Carrito carritoSeleccionado) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => carritoEditScreen(carrito: carritoSeleccionado)));
  }

  void delete(String id) {
    ref.read(carritosProvider.notifier).delete(id);
  }

  void mostrarCarrito(BuildContext context, Carrito carrito) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => carritoScreen(carrito: carrito)));
  }
}
