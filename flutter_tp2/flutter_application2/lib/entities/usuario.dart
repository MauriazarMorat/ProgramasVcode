import 'package:cloud_firestore/cloud_firestore.dart';
class Usuario {
  String email;
  String nombre;
  String direccion;
  String id;

  Usuario({
    required this.email,
    required this.nombre,
    required this.direccion,
    required this.id,
  });

  // Convierte a Map para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'nombre': nombre,
      'direccion': direccion,
      'id': id,
    };
  }

  // Crea un Usuario desde Firestore
  static Usuario fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Usuario(
      email: data?['email'] ?? '',
      nombre: data?['nombre'] ?? '',
      direccion: data?['direccion'] ?? '',
      id: data?['id'] ?? '',
    );
  }
}

// Lista de usuarios de ejemplo
