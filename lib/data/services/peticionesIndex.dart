import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PeticionesIndex {
  final FirebaseFirestore _db;
  final UploadTask? uploadTask;

  PeticionesIndex({FirebaseFirestore? db, this.uploadTask})
      : _db = db ?? FirebaseFirestore.instance;

  Future<String> consultarIndex() async {
    // Usa una transacción para leer y escribir el índice
    return await _db.runTransaction<String>((transaction) async {
      // Obtiene el documento que contiene el índice
      final doc =
          await transaction.get(_db.collection('PropuestaIndex').doc('campo'));
      // Lee el valor del índice
      final indice = doc['index'] as int;
      // Incrementa el índice en uno
      final nuevoIndice = indice + 1;
      // Actualiza el índice en el documento
      transaction.update(doc.reference, {'index': nuevoIndice});
      // Devuelve el valor del índice como String
      return nuevoIndice.toString();
    });
  }
}
