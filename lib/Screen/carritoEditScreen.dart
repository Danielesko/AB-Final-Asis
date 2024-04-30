import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/carritoData.dart';
import 'package:flutter_application_1/provider/carritosProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class carritoEditScreen extends ConsumerStatefulWidget {
  final Carrito carrito;
  const carritoEditScreen({super.key, required this.carrito});

  @override
  ConsumerState<carritoEditScreen> createState() => _carritoEditScreenState();
}

class _carritoEditScreenState extends ConsumerState<carritoEditScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textFieldController.text = widget.carrito.nombre;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar nombre"),
        backgroundColor: const Color.fromARGB(255, 169, 72, 37),
        centerTitle: true,
      ),
      body: TextField(
        controller: textFieldController,
        decoration: const InputDecoration(
            hintText: "Introduce el nuevo nombre"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => edita(),
        child: const Icon(Icons.save),
      ),
    );
  }
  edita() {
    Carrito nuevoCarritoAct = Carrito(nombre: textFieldController.text);

    ref
        .read(carritosProvider.notifier)
        .edita(nuevoCarritoAct, widget.carrito.id);

    Navigator.of(context).pop();
  }
}