import 'package:flutter_application2/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class _LoginView extends StatefulWidget {
  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  // Variables
  TextEditingController textoUsuario = TextEditingController();  
  TextEditingController textoContra = TextEditingController(); 

  bool textoobscuro = true;
  String usuarioPuesto = "NoInput";
  String contraPuesta = "NoInput"; 
  String resultado = "";
  Color colorRespuesta = Colors.white;
  String username = "Oktubre86";
  String password = "PatricioRey";

  void enviar(BuildContext context) {
    usuarioPuesto = textoUsuario.text;
    contraPuesta = textoContra.text;

    if (usuarioPuesto == "" && contraPuesta == "") {
      resultado = "No pusiste nada, jaja";
      colorRespuesta = const Color.fromARGB(255, 138, 173, 8);
    } else if (usuarioPuesto == "") {
      resultado = "No pusiste Usuario";
      colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
    } else if (contraPuesta == "") {
      resultado = "No pusiste Contraseña";
      colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
    } else if (usuarioPuesto == username && contraPuesta == password) {
      resultado = "Correcto, logeandose...";
      colorRespuesta = const Color.fromARGB(255, 32, 250, 3);
      context.pushNamed(HomeScreen.name, extra: textoUsuario.text);
    } else {
      resultado = "Contraseña/Usuario incorrectos";
      colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(resultado), duration: Duration(seconds: 2)),
    );
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
              controller: textoUsuario,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Usuario",
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
