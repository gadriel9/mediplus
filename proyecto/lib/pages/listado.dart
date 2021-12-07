import 'package:proyecto/database/dbcategorias.dart';
import 'package:flutter/material.dart';

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  late DatabaseCategorias db;
  List docs = [];
  initialise() {
    db = DatabaseCategorias();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE0B2),
      appBar: AppBar(
        centerTitle: true,
        //color de fondo del appbar
        backgroundColor: const Color(0xFFFFE0B2),
        //Texto "Farmacias"
        title: const Text("Listado de Productos"),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 45.0,
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.orange,
                onPressed: () {},
                child: Text(
                  docs[index]['nombre'],
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget image() {
  return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
    image: NetworkImage(
        "https://www.lechepuleva.es/documents/13930/203222/uva_g.jpg/4ee0cd1b-f0d3-41cc-80b8-17e5a80b834a?t=1422618555000"),
  )));
}
