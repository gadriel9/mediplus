import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediplus/db/mediplusdb.dart';
import 'package:mediplus/models/registrodb.dart';
import 'package:mediplus/pages/login.dart';

class Registrarse extends StatelessWidget {
  static const String ROUTE = "/Registrarse";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
      ),
      body: Container(
        child: _Registro(),
      ),
    );
  }
}

class _Registro extends StatelessWidget {
  final _fromKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final usuarioController = TextEditingController();
  final correoController = TextEditingController();
  final contraseniaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _fromKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            const Text(
              "Registro",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: nombreController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar un nombre";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Nombre", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: apellidoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar un apellido";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Apellido", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: usuarioController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar un usuario";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Usuario", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: correoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar un correo";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Correo", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: contraseniaController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar una contraseña";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Contraseña", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            CupertinoButton(
                child: const Text("Registrarse"),
                color: Colors.blue,
                onPressed: () {
                  //Valida si los campos estan llenos
                  if (_fromKey.currentState!.validate()) {
                    print(nombreController.text);
                    //Metodo para insertar los registros de cada campo
                    Operaciones.insert(guardarRegistro(
                        nombre: nombreController.text,
                        apellido: apellidoController.text,
                        usuario: usuarioController.text,
                        correo: correoController.text,
                        contrasenia: contraseniaController.text));
                    //Al presionar el boton de registrar se limpian los campos
                    nombreController.clear();
                    apellidoController.clear();
                    usuarioController.clear();
                    correoController.clear();
                    contraseniaController.clear();
                    /*
                    Navigator.pushNamed(context, Login.ROUTE);
                    */
                  }
                }),
            const SizedBox(height: 15),
            CupertinoButton(
                child: const Text("Cancelar"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, Login.ROUTE);
                })
          ],
        ),
      ),
    );
  }
}
