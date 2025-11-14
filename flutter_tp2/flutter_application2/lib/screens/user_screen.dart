import 'package:flutter_application2/screens/favs_screen.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/providers/usuario_nextprovider.dart';
import 'package:flutter_application2/screens/favs_screen.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_add_screen.dart';
import 'package:flutter_application2/screens/game_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application2/screens/prelogin_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_application2/entities/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerStatefulWidget {
  static const String name = 'user';
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(gameProvider.notifier).getAllGames();
  }

  @override
  Widget build(BuildContext context) {
    List<Game> gameList = ref.watch(gameProvider);
    final usuario = ref.watch(UsuarioProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${usuario.nombre}!'),
      ),
      body: _UserView(
        gameList: gameList,
        usuario: usuario,
        ref: ref, 
      ),
    );
  }
}

class _UserView extends StatelessWidget {
  final List<Game> gameList;
  final Usuario usuario;
  final WidgetRef ref; 

  const _UserView({
    required this.gameList,
    required this.usuario,
    required this.ref,
  });

  Future<void> LogOut(BuildContext context) async {
    ref.read(UsuarioProvider.notifier).logOut(); 
    context.goNamed(PreloginScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('User Information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('Name: ${usuario.nombre}', style: TextStyle(fontSize: 18)),
          Text('Email: ${usuario.email}', style: TextStyle(fontSize: 18)),
          Text('Direccion: ${usuario.direccion}', style: TextStyle(fontSize: 18)),
          ElevatedButton(
            onPressed: () async => LogOut(context),
            child: const Text("Log Out"),
          ),
          ElevatedButton(
            onPressed: () async => 
            context.pushNamed(FavsScreen.name),
            child: const Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
