import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/carritoData.dart';
import 'package:flutter_application_1/provider/carritosProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class carritoAddScreen extends ConsumerStatefulWidget {
  const carritoAddScreen({super.key});

  @override
  ConsumerState<carritoAddScreen> createState() => _carritoAddScreenState();
}
class _carritoAddScreenState extends ConsumerState<carritoAddScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo carrito"),
        backgroundColor: const Color.fromARGB(255, 169, 72, 37),
        centerTitle: true,
      ),
      body: TextField(
        controller: textFieldController,
        decoration: const InputDecoration(
            hintText: "Introduce el nombre de tu nuevo carrito"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => saveCarrito(),
        child: const Icon(Icons.save),
      ),
    );
  }
   saveCarrito() {
    Carrito nuevoCarrito = Carrito(nombre: textFieldController.text);

    ref.read(carritosProvider.notifier).add(nuevoCarrito);

    Navigator.of(context).pop();
  }
}