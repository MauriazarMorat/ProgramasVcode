import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application2/entities/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final UsuarioProvider = StateNotifierProvider<UsuarioNotifier, List<Usuario>>(
  (ref) => UsuarioNotifier(FirebaseFirestore.instance),
);

class UsuarioNotifier extends StateNotifier<List<Usuario>> {
  final FirebaseFirestore db;

  UsuarioNotifier(this.db)
      : _currentUsuario = Usuario(nombre: '', email: '',direccion: '', id: ''),
        super([]);

  Future<void> getAllUsuarios() async {
    final docs = db.collection('users').withConverter(
        fromFirestore: Usuario.fromFirestore,
        toFirestore: (Usuario usuario, _) => usuario.toFirestore());
    final usuarios = await docs.get();
    state = usuarios.docs.map((d) => d.data()).toList();
  }

  // Now always non-nullable
  Usuario _currentUsuario;
  Usuario get currentUsuario => _currentUsuario;
  
  void setCurrentUsuario(Usuario usuario) {
    _currentUsuario = usuario;
  }
  
  Future<void> createWithPassword(String email, String contrasena) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: contrasena,
      );
    } on FirebaseAuthException catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<void> addUsuario(Usuario usuario) async {
    final doc = db.collection('users').doc(); //Con esto nos paramos en el doc entero. 
    try {
      usuario.id = doc.id;
      await doc.set(usuario.toFirestore());
      state = [...state, usuario];
    } catch (e) {
      print(e);
    }
  }
  
}