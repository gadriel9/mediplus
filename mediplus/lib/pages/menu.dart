import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediplus/pages/listado_usuarios.dart';

class Menu extends StatelessWidget {
  static const String ROUTE = "/Menu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Container(
        child: _Contenido(),
      ),
    );
  }
}

class _Contenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoButton(
        child: const Text("Listado de Usuarios"),
        color: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, ListadoUsuarios.ROUTE);
        },
      ),
    );
  }
}
