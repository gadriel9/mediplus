import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediplus/pages/menu.dart';
import 'package:mediplus/pages/registro.dart';

class Login extends StatelessWidget {
  static const String ROUTE = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        child: _Login(),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/fondoL.jpg"),
        ),
      ),*/
      padding: const EdgeInsets.all(15),
      child: Form(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            const Text(
              "Iniciar Sesion",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Correo", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Contraseña", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            CupertinoButton(
                child: const Text("Ingresar"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, Menu.ROUTE);
                }),
            const SizedBox(height: 15),
            CupertinoButton(
                child: const Text("Registrarse"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, Registrarse.ROUTE);
                })
          ],
        ),
      ),
    );
  }
}
