import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application2/entities/usuario.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final UsuarioProvider = StateNotifierProvider<UsuarioNotifier, Usuario>(
  (ref) => UsuarioNotifier(FirebaseFirestore.instance),
);

class UsuarioNotifier extends StateNotifier<Usuario> {
  final FirebaseFirestore db;

  UsuarioNotifier(this.db):super(
    Usuario(  
      id: '', 
      nombre: '', 
      email: '',  
      direccion: '', 
      favs: [],
      )
    );
  
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
    
      final usuario = await buscarUsuario(userCredential.user!);
      state = usuario;
      return("Succesfully signed in");
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
      return "Error al iniciar sesión";
  }
}



  Future<void> addUsuario(Usuario usuario) async {
    final doc = db.collection('users').doc(); //Con esto nos paramos en el doc entero. 
    try {
      usuario.id = doc.id;
      await doc.set(usuario.toFirestore());
    } catch (e) {
      print(e);
    }
  }

  
  
  Future<Usuario> buscarUsuario(User user) async{
    try {
    final docs = db.collection('users').withConverter(
        fromFirestore: Usuario.fromFirestore,
        toFirestore: (Usuario usuario, _) => usuario.toFirestore());
    final usuarios = await docs.get();
    List<Usuario> listaUsuarios = usuarios.docs.map((d) => d.data()).toList();

    final Current = listaUsuarios.firstWhere((u) => u.email == user.email);
    return Current;
     } catch (e) {
      print("DEBUG ERRORES: ");
      print(e);
      print("DEBUG ARRIBA: ");
      return Usuario(  
        id: '', 
        nombre: 'Failure', 
        email: '',  
        direccion: '', 
        favs: [],
        );
       }
  }
  Future<void> favoriteGame(Usuario user, Game game) async{
    final doc = db.collection('users').doc(user.id);  
    try {
      List<String> nuevalista = user.favs;
      if (nuevalista.contains(game.id)){
        //Si esta en favoritos
      nuevalista.remove(game.id);
      }else{
        // No esta en favoritos.
      nuevalista.add(game.id);
      }
      
      Usuario newuser = Usuario(
        email: user.email,
        nombre: user.nombre,
        id: user.id,
        direccion: user.direccion,
        favs: nuevalista,
        );
      await doc.set(newuser.toFirestore());
      
     } catch (e) {
      print("DEBUG ERRORES: ");
      print(e);
      print("DEBUG ARRIBA: ");
      
  }
   }
}