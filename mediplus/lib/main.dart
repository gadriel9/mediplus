import 'package:flutter/material.dart';
import 'package:mediplus/pages/listado_usuarios.dart';
import 'package:mediplus/pages/login.dart';
import 'package:mediplus/pages/menu.dart';
import 'package:mediplus/pages/registro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Login.ROUTE,
      routes: {
        Login.ROUTE: (_) => Login(),
        Registrarse.ROUTE: (_) => Registrarse(),
        Menu.ROUTE: (_) => Menu(),
        ListadoUsuarios.ROUTE: (_) => ListadoUsuarios(),
      },
    );
  }
}
