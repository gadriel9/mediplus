import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/database/dbusuario.dart';
import 'package:proyecto/pages/listado.dart';
import 'package:proyecto/pages/signin.dart';

class Login extends StatefulWidget {
  static String id = 'login page';

  @override
  State<Login> createState() => _LoginState();
}

late DatabaseUsuarios db;
List docs = [];

final _fromKey = GlobalKey<FormState>();
final userController = TextEditingController();
final passController = TextEditingController();
String loggedUser = "";

class _LoginState extends State<Login> {
  initialise() {
    db = DatabaseUsuarios();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  //Se inicia el estado de la conexión...
  @override
  void initState() {
    super.initState();
    initialise();
  }

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
  // Si retorna true, se inicia sesión.
  bool validarLogin(String correo, String pass) {
    bool result = false;
    int i = 0;
    while (i < docs.length) {
      if (docs[i]['correo'] == correo && docs[i]['password'] == pass) {
        result = true;
        loggedUser = docs[i]['nombre'];
        i = docs.length;
      }
      i++;
    }
    return result;
  }

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
                  if (_fromKey.currentState!.validate()) {
                    if (validarLogin(
                        userController.text, passController.text)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Categorias()));
                    } else {}
                    userController.text = "";
                    passController.text = "";
                  }
                }),
            const SizedBox(height: 15),
            CupertinoButton(
                child: const Text("Registrarse"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registrarse()));
                })
          ],
        ),
      ),
    );
  }
}
