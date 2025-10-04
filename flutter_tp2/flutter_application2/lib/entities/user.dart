import 'package:cloud_firestore/cloud_firestore.dart';
class User {
  String email;
  String contrasena;
  String nombre;
  String direccion;

  User({
    required this.email,
    required this.contrasena,
    required this.nombre,
    required this.direccion,
  });

  // Convierte a Map para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'contrasena': contrasena,
      'nombre': nombre,
      'direccion': direccion,
    };
  }

  // Crea un User desde Firestore
  static User fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      email: data?['email'] ?? '',
      contrasena: data?['contrasena'] ?? '',
      nombre: data?['nombre'] ?? '',
      direccion: data?['direccion'] ?? '',
    );
  }
}

// Lista de usuarios de ejemplo
