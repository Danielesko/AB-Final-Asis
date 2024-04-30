import 'package:flutter/material.dart';
class Sesion extends StatefulWidget {
  const Sesion({super.key});

  @override
  _SesionState createState() => _SesionState();
}

class _SesionState extends State<Sesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sesion'),
      ),
      body: const Center(
        child: Text('Welcome to Sesion'),
      ),
    );
  }
}