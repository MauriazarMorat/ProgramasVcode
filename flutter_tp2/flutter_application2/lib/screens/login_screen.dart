import 'package:flutter_application2/providers/usuario_nextprovider.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Admin Login:
// email: 1
// contra: 1


class LoginScreen extends ConsumerStatefulWidget {
  static const String name = 'login';
  const LoginScreen({super.key});

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
    // Fetch Usuarios from provider
    
  }

  Usuario? encontrarUsuario(List<Usuario> Usuarios, String usuarioabuscar) {
    try {
      return Usuarios.firstWhere((Usuario) => Usuario.email == usuarioabuscar);
    } catch (_) {
      return null;
    }
  }
  
  void enviar(BuildContext context) async {
    final emailPuesto = textoEmail.text;
    final contraPuesta = textoContra.text;
    final mensaje = await ref.read(UsuarioProvider.notifier).signinWithPassword(emailPuesto, contraPuesta);

    if (mensaje == ("Succesfully signed in")){
      context.pushNamed(GameScreen.name);
    } 

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: Duration(seconds: 2), // tiempo que dura visible
      ),
    );
       
   
  }


  @override
  Widget build(BuildContext context) {
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
              onPressed: () async => enviar(context),
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
