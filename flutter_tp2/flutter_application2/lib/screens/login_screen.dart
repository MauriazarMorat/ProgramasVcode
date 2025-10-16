import 'package:flutter_application2/providers/user_nextprovider.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Admin Login:
// email: 1
// contra: 1


class LoginScreen extends ConsumerStatefulWidget {
  static const String name = 'login';
  final String selectedMode;
  const LoginScreen({super.key, required this.selectedMode});

  @override
  ConsumerState<LoginScreen> createState() => _LoginView();
}

class _LoginView extends ConsumerState<LoginScreen> {
  // Controllers
  final TextEditingController textoEmail = TextEditingController();
  final TextEditingController textoContra = TextEditingController();

  bool textoobscuro = true;
  String resultado = "";
  Color colorRespuesta = Colors.white;

  @override
  void initState() {
    super.initState();
    // Fetch users from provider
    ref.read(userProvider.notifier).getAllUsers();
  }

  User? encontrarUsuario(List<User> users, String usuarioabuscar) {
    try {
      return users.firstWhere((user) => user.email == usuarioabuscar);
    } catch (_) {
      return null;
    }
  }

  void enviar(BuildContext context, List<User> users) {
    
    final emailPuesto = textoEmail.text;
    final contraPuesta = textoContra.text;
    print('DEBUG: emailPuesto = ' + emailPuesto);
    print('DEBUG: contraPuesta = ' + contraPuesta);

    if (emailPuesto == "" && contraPuesta == "") {
      setState(() {
        resultado = "No pusiste nada";
        colorRespuesta = const Color.fromARGB(255, 138, 173, 8);
      });
    } else if (emailPuesto == "" && contraPuesta != "") {
      setState(() {
        resultado = "No pusiste Usuario";
        colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
      });
    } else {
      // Use try-catch to find user or handle not found
      User userEncontrado;
      try {
        userEncontrado = users.firstWhere((user) => user.email == emailPuesto);
        if (contraPuesta == "") {
          setState(() {
            resultado = "Ese email existe, pero no pusiste contraseña";
            colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
          });
        } else if (userEncontrado.contrasena != contraPuesta && userEncontrado.contrasena != "") {
          setState(() {
            resultado = "Contraseña incorrecta";
            colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
          });
        } else if (userEncontrado.contrasena == contraPuesta) {
          setState(() {
            resultado = "Correcto, logeandose...";
            colorRespuesta = const Color.fromARGB(255, 32, 250, 3);
          });
          ref.read(userProvider.notifier).setCurrentUser(userEncontrado);
          context.goNamed(GameScreen.name);
        }
      } catch (e) {
        setState(() {
          resultado = "Usuario no encontrado";
          colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
        });
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(resultado), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(userProvider);
    print('DEBUG: userList = ' + users.map((u) => u.email).toList().toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text("Logeate", style: TextStyle(fontSize: 40, color: Colors.black)),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              child: TextField(
                controller: textoEmail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
            ),
            const SizedBox(height: 17),
            SizedBox(
              width: 200,
              child: TextField(
                controller: textoContra,
                obscureText: textoobscuro,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => enviar(context, users),
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
