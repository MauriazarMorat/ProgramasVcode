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
  
  Future<String> createWithPassword(String email, String contrasena) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: contrasena,
      );
      return("Succesfully created User");
    } on FirebaseAuthException catch (e) {
    // acá evaluamos los posibles errores comunes
    if (e.code == 'weak-password') {
      return "La contraseña es demaciado debil";
    } else if (e.code == 'email-already-in-use') {
      return "Ese email ya está registrado";
    } else {
      // cualquier otro error no previsto
      return "Ocurrió un error inesperado";
    }
  } catch (e) {
    // errores no relacionados con FirebaseAuth
    return "Error al crear el usuario";
  }
}

  Future<String> signinWithPassword(String email, String contrasena) async {
    try {
      final userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: contrasena,
      );

      final user = userCredential.user;
      
      return("Succesfully created User");
    } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return('No existe un usuario con ese email');
    } else if (e.code == 'wrong-password') {
      return('La contraseña esta mal');
    } else {
      return("Ocurrio un error inesperado");
    }
    } catch (e) {
      // errores no relacionados con FirebaseAuth
      return "Error al crear el usuario";
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