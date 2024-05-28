// ignore_for_file: camel_case_types

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
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: TextField(
        controller: textFieldController,
        decoration: const InputDecoration(
          hintText: "Introduce el nombre de tu nuevo carrito",
          hintStyle: TextStyle(color: Colors.orange),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => saveCarrito(),
        backgroundColor: Colors.orange,
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
