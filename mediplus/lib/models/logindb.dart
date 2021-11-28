class Login {
  final String usuario;
  final String contrasenia;

  Login({required this.usuario, required this.contrasenia});

  Map<String, dynamic> toMap() {
    return {'usuario': usuario, 'contrasenia': contrasenia};
  }
}
