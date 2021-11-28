import 'package:sqflite/sqflite.dart';
import 'package:mediplus/models/registrodb.dart';
import 'package:path/path.dart';

class Operaciones {
  static Future<Database> _openDB() async {
    return openDatabase(
        join(await getDatabasesPath(), 'medicinasyfarmacias.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE registro (id INTEGER PRIMARY KEY, nombre TEXT, apellido TEXT, usuario TEXT, correo TEXT, contrasenia TEXT)",
      );
    }, version: 1);
  }

  //METODO PARA GUARDAR LOS DATOS EN EL REGISTRO
  static Future<int> insert(guardarRegistro guardarR) async {
    Database database = await _openDB();

    return database.insert("registro", guardarR.toMap());
  }

  //METODO PARA LISTAR LOS USUARIOS CREADOS
  static Future<List<guardarRegistro>> listadoU() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> usuariosMap =
        await database.query("registro");

    for (var u in usuariosMap) {
      // ignore: avoid_print
      print("___" + u['nombre']);
    }

    return List.generate(
        usuariosMap.length,
        (i) => guardarRegistro(
            nombre: usuariosMap[i]['nombre'],
            apellido: usuariosMap[i]['apellido'],
            usuario: usuariosMap[i]['usuario'],
            correo: usuariosMap[i]['correo'],
            contrasenia: usuariosMap[i]['contrasenia']));
  }
}
