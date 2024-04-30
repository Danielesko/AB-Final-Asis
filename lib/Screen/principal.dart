import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/carritosProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Sesion extends ConsumerStatefulWidget {
  const Sesion({super.key});

  @override
  ConsumerState<Sesion> createState() => _SesionState();
}



class _SesionState extends  ConsumerState<Sesion> {
  @override
  Widget build(BuildContext context) {

    final listaCarritos = ref.watch(carritosProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Carritos'),
      ),
      body: const Center(
        child: Text('Welcome to Sesion'),
      ),
    );
  }
}