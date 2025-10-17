import 'package:flutter_application2/providers/usuario_nextprovider.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter_application2/entities/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application2/screens/prelogin_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Admin Login:
// email: 1
// contra: 1


class RegisterScreen extends ConsumerStatefulWidget {
  static const String name = 'register';
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterView();
}

class _RegisterView extends ConsumerState<RegisterScreen> {
  // Controllers
  final TextEditingController textoEmail = TextEditingController();
  final TextEditingController textoContra = TextEditingController();
  final TextEditingController textoNombre = TextEditingController();
  final TextEditingController textoDirec = TextEditingController();

  bool textoobscuro = true;
  String resultado = "";
  Color colorRespuesta = Colors.white;

  @override
  void initState() {
    super.initState();
    // Fetch Usuarios from provider
    
  }

  //Declaramos enviar como un future void con async porque adentor va a haber una funcion await.
  Future<void> enviar(BuildContext context) async {
    
    final emailPuesto = textoEmail.text;
    final contraPuesta = textoContra.text;
    final nombrePuesto = textoNombre.text;
    final direcPuesta = textoDirec.text;

    print('DEBUG: emailPuesto = ' + emailPuesto);
    print('DEBUG: contraPuesta = ' + contraPuesta);
    print('DEBUG: nombrePuesto = ' + nombrePuesto);
    print('DEBUG: direcPuesta = ' + direcPuesta);

    Usuario nuevoUsuario = Usuario(
      email: emailPuesto,
      nombre: nombrePuesto,
      direccion: direcPuesta,
      id: '0',
      );
    
    final message = await ref.read(UsuarioProvider.notifier).createWithPassword(emailPuesto, contraPuesta);
    
    if (message == ("Succesfully created User")){
      ref.read(UsuarioProvider.notifier).addUsuario(nuevoUsuario);
      context.pushNamed(PreloginScreen.name);
      
    } 

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2), // tiempo que dura visible
      ),
    );

    
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text("Registrate", style: TextStyle(fontSize: 40, color: Colors.black)),
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
            const SizedBox(height: 17),
            SizedBox(
              width: 200,
              child: TextField(
                controller: textoNombre,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nombre",
                ),
              ),
            ),
            const SizedBox(height: 17),
            SizedBox(
              width: 200,
              child: TextField(
                controller: textoDirec,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Direccion",
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
