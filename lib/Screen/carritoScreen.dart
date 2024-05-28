import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/carritoData.dart';
import 'package:flutter_application_1/provider/carritosProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: camel_case_types
class carritoScreen extends ConsumerStatefulWidget {
  final Carrito carrito;
  const carritoScreen({super.key, required this.carrito});

  @override
  ConsumerState<carritoScreen> createState() => _carritoScreenState();
}

// ignore: camel_case_types
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
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: TextField(
        controller: textFieldController,
        decoration: const InputDecoration(
          hintText: "Introduce los productos",
          hintStyle: TextStyle(color: Colors.orange),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => editaProductos(),
        backgroundColor: Colors.orange,
        child: const Icon(Icons.save),
      ),
    );
  }

  editaProductos() {
    Carrito nuevoProductosCarrito = Carrito(
        nombre: textFieldController.text, productos: textFieldController.text);

    ref
        .read(carritosProvider.notifier)
        .editaProductos(nuevoProductosCarrito, widget.carrito.id);

    Navigator.of(context).pop();
  }
}
