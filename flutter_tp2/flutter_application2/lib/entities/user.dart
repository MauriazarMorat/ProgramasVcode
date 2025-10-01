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
final user1 = User(
  email: "Oktubre86@gmail.com",
  contrasena: "PatricioRey",
  nombre: "Ricotero",
  direccion: "Almagro",
);

final user2 = User(
  email: "marcelotinelli@gmail.com",
  contrasena: "Showmatch",
  nombre: "Marce",
  direccion: "Palermo",
);

final user3 = User(
  email: "romanotero9@gmail.com",
  contrasena: "Futbol100",
  nombre: "Roman",
  direccion: "Palermo",
);

final user4 = User(
  email: "ArbasetiFelipe@gmail.com",
  contrasena: "OtakuFurro",
  nombre: "Feli",
  direccion: "Once",
);

final user5 = User(
  email: "1001dalmatas@gmail.com",
  contrasena: "101dalmata",
  nombre: "1dalmata",
  direccion: "Londres",
);

final user6 = User(
  email: "1",
  contrasena: "1",
  nombre: "1dalmata",
  direccion: "Londres",
);

// Lista con todos los usuarios
List<User> users = [user1, user2, user3, user4, user5, user6];