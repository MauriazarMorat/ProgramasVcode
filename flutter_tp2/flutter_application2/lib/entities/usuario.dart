import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application2/entities/game.dart';
class Usuario {
  String email;
  String nombre;
  String direccion;
  String id;
  List<String> favs; //Una lista de strings de ID de juegos favoritos

  Usuario({
    required this.email,
    required this.nombre,
    required this.direccion,
    required this.id,
    required this.favs,
  });

  // Convierte a Map para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'nombre': nombre,
      'direccion': direccion,
      'id': id,
      'favs': favs,
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
      favs: List<String>.from(data?['favs'] ?? ''), //Esto es porque firebase devuelve una lista 
    );
  }
}

// Lista de usuarios de ejemplo
