import 'package:flutter/material.dart';
import 'package:mediplus/db/mediplusdb.dart';
import 'package:mediplus/models/registrodb.dart';

class ListadoUsuarios extends StatelessWidget {
  static const String ROUTE = "/Listado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Usuarios"),
      ),
      body: ListaUsuarios(),
    );
  }
}

class ListaUsuarios extends StatefulWidget {
  @override
  State<ListaUsuarios> createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  List<guardarRegistro> usuarios = [];

  @override
  void initState() {
    _loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (_, i) => _createItem(i),
    );
  }

  _loadData() async {
    List<guardarRegistro> auxGR = await Operaciones.listadoU();
    setState(() {
      usuarios = auxGR;
    });
  }

  _createItem(int i) {
    return ListTile(
      title: Text(usuarios[i].nombre),
    );
  }
}
