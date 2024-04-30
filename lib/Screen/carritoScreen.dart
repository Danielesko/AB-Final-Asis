import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/carritoData.dart';
import 'package:flutter_application_1/provider/carritosProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class carritoScreen extends ConsumerStatefulWidget {
  final Carrito carrito;
  const carritoScreen({super.key, required this.carrito});

  @override
  ConsumerState<carritoScreen> createState() => _carritoScreenState();
}

class _carritoScreenState extends ConsumerState<carritoScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textFieldController.text = widget.carrito.nombre;
    textFieldController.text = widget.carrito.productos!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar productos"),
        backgroundColor: const Color.fromARGB(255, 169, 72, 37),
        centerTitle: true,
      ),
      body: TextField(
        controller: textFieldController,
        decoration: const InputDecoration(
            hintText: "Introduce los productos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => editaProductos(),
        child: const Icon(Icons.save),
      ),
    );
  }
  editaProductos() {
    Carrito nuevoProductosCarrito = Carrito(nombre: textFieldController.text,productos: textFieldController.text);

    ref
        .read(carritosProvider.notifier)
        .editaProductos(nuevoProductosCarrito, widget.carrito.id);

    Navigator.of(context).pop();
  }
}