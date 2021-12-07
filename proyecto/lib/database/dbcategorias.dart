import 'package:cloud_firestore/cloud_firestore.dart';

//Se hará referencia a esta clase en el archivo dart en el cual se desea realizar consultas hacia la base.
class DatabaseCategorias {
  //Estas líneas permiten inicializar correctamente la instancia de la conexión a la base.
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  //Función para LEER TODOS los registros
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('productos').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "nombre": doc['nombre']};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return read();
  }

  //Función para obtener todos los medicamentos pertenecientes a una categoría
  Future<List> readMedicinas(String id) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore
          .collection('categorias')
          .doc(id)
          .collection('medicinas')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "nombre": doc['nombre'],
            "descrip": doc['descrip'],
            "imagen": doc['imagen'],
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return read();
  }

  //ESTAS FUNCIONES NO SE ESTÁN UTILIZANDO. ESTÁN PROGRAMADAS PARA EN UN FUTURO
  //Función para CREAR nuevos registros
  Future<void> create(String name) async {
    try {
      await firestore.collection("categorias").add({
        'nombre': name,
      });
    } catch (e) {
      print(e);
    }
  }
}
