class Carrito {
  
  String nombre;
  String productos;
  double? precio; // Hace que el precio sea opcional

  Carrito({required this.nombre, required this.productos, this.precio});
}
