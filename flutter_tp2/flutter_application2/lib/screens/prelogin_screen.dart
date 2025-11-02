import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter_application2/screens/login_screen.dart';
import 'package:flutter_application2/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PreloginScreen extends StatelessWidget{
  static const String name = 'prelogin';
  const PreloginScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: _PreloginView()
  );
 }
}
class _PreloginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.pushNamed(LoginScreen.name);
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(RegisterScreen.name);
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}