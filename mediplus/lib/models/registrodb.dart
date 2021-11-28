class guardarRegistro {
  final String nombre;
  final String apellido;
  final String usuario;
  final String correo;
  final String contrasenia;

  guardarRegistro(
      {required this.nombre,
      required this.apellido,
      required this.usuario,
      required this.correo,
      required this.contrasenia});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'usuario': usuario,
      'correo': correo,
      'contrasenia': contrasenia
    };
  }
}
