import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/database/dbusuario.dart';

class Registrarse extends StatelessWidget {
  static String id = 'register page';

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

late DatabaseUsuarios db;

final _fromKey = GlobalKey<FormState>();
final nombreController = TextEditingController();
final apellidoController = TextEditingController();
final usuarioController = TextEditingController();
final correoController = TextEditingController();
final contraseniaController = TextEditingController();

class _Registro extends StatefulWidget {
  @override
  State<_Registro> createState() => _RegistroState();
}

class _RegistroState extends State<_Registro> {
  List docs = [];

  initialise() {
    db = DatabaseUsuarios();
    db.initiliase();
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

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
              obscureText: true,
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
                  if (_fromKey.currentState!.validate()) {
                    db.create(
                      nombreController.text,
                      apellidoController.text,
                      usuarioController.text,
                      correoController.text,
                      contraseniaController.text,
                    );
                    Navigator.pop(context, true);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const Dialogo(
                              "Usuario registrado exitosamente");
                        });
                  }
                }),
            const SizedBox(height: 15),
            CupertinoButton(
                child: const Text("Cancelar"),
                color: Colors.blue,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class Dialogo extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: use_key_in_widget_constructors
  const Dialogo(this.title);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Aviso"),
      content: Text(title),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    );
  }
}
