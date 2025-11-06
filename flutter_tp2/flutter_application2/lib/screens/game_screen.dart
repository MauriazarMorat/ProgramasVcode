import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/providers/usuario_nextprovider.dart';
import 'package:flutter_application2/screens/favs_screen.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_add_screen.dart';
import 'package:flutter_application2/screens/game_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_application2/entities/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application2/screens/user_screen.dart';

class GameScreen extends ConsumerStatefulWidget {
  static const String name = 'game';
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
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
        actions: [
          IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
              context.pushNamed(UserScreen.name);
          }
          )
        ],
      ),
      body: _GamesView(gameList: gameList, usuario: usuario),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed(GameAddScreen.name, extra: gameList.length);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GamesView extends StatelessWidget {
  final List<Game> gameList;
  final Usuario usuario;
  const _GamesView({required this.gameList, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameList.length,
      itemBuilder: (context, index) {
        final game = gameList[index];

        return GestureDetector(
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Consumer(
                  builder: (context, ref, _) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text("Editar"),
                          onTap: () {
                            Navigator.of(context).pop();
                            context.pushNamed(GameEditScreen.name,
                                extra: game);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.remove),
                          title: Text("Eliminar"),
                          onTap: () async {
                            Navigator.of(context).pop();
                            await ref.read(gameProvider.notifier).deleteGame(game);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            usuario.favs.contains(game.id) ? Icons.star : Icons.star_border,
                            color: usuario.favs.contains(game.id) ? Colors.yellowAccent : null,
                            ),
                          
                          title: Text(usuario.favs.contains(game.id) ? "Sacar de Favoritos" : "Agregar a favoritos"),
                          onTap: () async {
                            Navigator.of(context).pop();
                            await ref.read(UsuarioProvider.notifier).favoriteGame(usuario,game);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          onTap: () {
            context.pushNamed(GameDetailScreen.name, extra: game);
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: Image.network(
                      game.posterUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/GenericGamePoster.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game.name,
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          game.studio,
                          style: TextStyle(fontSize: 19),
                        ),
                        Text(
                          game.description,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Pegi: ${game.pegi}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


