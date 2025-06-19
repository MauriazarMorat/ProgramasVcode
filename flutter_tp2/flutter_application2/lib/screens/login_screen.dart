import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/providers/user_provider.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter_application2/screens/game_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/user.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application2/providers/game_provider.dart';

class LoginScreen extends StatelessWidget{
  static const String name = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: _LoginView()
  );
 }
}

class _LoginView extends ConsumerStatefulWidget {
  @override
  ConsumerState<_LoginView> createState() => _LoginViewState(); //Cuando se hace un estado es así jaja
}

class _LoginViewState extends ConsumerState<_LoginView> {
  // Variables
  TextEditingController textoEmail = TextEditingController();  
  TextEditingController textoContra = TextEditingController(); 

  bool textoobscuro = true;
  String emailPuesto = "NoInput";
  String contraPuesta = "NoInput"; 
  String resultado = "";
  Color colorRespuesta = Colors.white;
  
  User encontrarUsuario (String usuarioabuscar){
    return users.firstWhere((user) => user.email == usuarioabuscar);
  }
  
  void enviar(BuildContext context) {
    emailPuesto = textoEmail.text;
    contraPuesta = textoContra.text;

    if (emailPuesto == "" && contraPuesta == "") {
      resultado = "No pusiste nada";
      colorRespuesta = const Color.fromARGB(255, 138, 173, 8);
    } else if (emailPuesto == "" && contraPuesta!="") {
      resultado = "No pusiste Usuario";
      colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
      //Como funciona any, busca si se cumple una condicion de un elemento de una lista. En este caso
      //Busca en la lista users, iterando sobre User bajo el nombre de "usuario", fijandose si su.email 
      //equivale
    } else if (users.any((usuario) => usuario.email == emailPuesto)) {
      User userEncontrado =encontrarUsuario(emailPuesto);
      if(contraPuesta==""){
        resultado = "Ese email existe, pero no pusiste contraseña";
        colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
      }
      if(userEncontrado.contrasena != contraPuesta && userEncontrado.contrasena!=""){
        resultado = "Contraseña incorrecta";
        colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
      }
      if(userEncontrado.contrasena == contraPuesta){
        resultado = "Correcto, logeandose...";
        colorRespuesta = const Color.fromARGB(255, 32, 250, 3);
        ref.read(userProvider.notifier).state = userEncontrado.nombre;
        context.goNamed(GameScreen.name,);

      }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(resultado), duration: Duration(seconds: 2)),
    );
  }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Text("Logeate", style: TextStyle(fontSize: 40, color: Colors.black)),
          SizedBox(height: 40),
          SizedBox(
            width: 200,
            child: TextField(
              controller: textoEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
          ),
          SizedBox(height: 17),
          SizedBox(
            width: 200,
            child: TextField(
              controller: textoContra,
              obscureText: textoobscuro,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Contraseña",
                suffixIcon: IconButton(
                  icon: Icon(
                    textoobscuro ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      textoobscuro = !textoobscuro;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => enviar(context),
            child: Text("Enviar"),
          ),
        ],
      ),
    );
  }
}
