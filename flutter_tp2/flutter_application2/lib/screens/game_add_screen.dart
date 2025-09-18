import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameAddScreen extends StatelessWidget {
  static const String name = 'game_add';
  final int givenId;
  const GameAddScreen({super.key, required this.givenId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Añadir Juego')),
      body: _GamesAdd(givenId: givenId),
    );
  }
}

class _GamesAdd extends ConsumerWidget {
  final int givenId;
  _GamesAdd({required this.givenId});

  final TextEditingController ngName = TextEditingController();
  final TextEditingController ngDescription = TextEditingController();
  final TextEditingController ngPegi = TextEditingController();
  final TextEditingController ngHardDescription = TextEditingController();
  final TextEditingController ngStudio = TextEditingController();
  final TextEditingController ngPosterUrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: ngName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nombre",
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: TextField(
                minLines: 3,
                maxLines: 5,
                controller: ngDescription,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Descripcion corta",
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: TextField(
                minLines: 5,
                maxLines: 8,
                controller: ngHardDescription,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Descipcion Larga",
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: TextField(
                controller: ngStudio,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Estudio",
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: TextField(
                controller: ngPosterUrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Poster Url",
                ),
              ),
            ),
            SizedBox(height: 50),

            SizedBox(
              width: 200,
              child: TextField(
                controller: ngPegi,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Su pegi",
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Game newGame = Game(
                  id: givenId + 1,
                  name: ngName.text,
                  description: ngDescription.text,
                  hardDescription: ngHardDescription.text,
                  pegi: ngPegi.text,
                  posterUrl: ngPosterUrl.text,
                  studio: ngStudio.text,
                );
                List<Game> listaNueva = ref.read(gamesProvider.notifier).state;

                ref.read(gamesProvider.notifier).state = [
                  ...listaNueva,
                  newGame,
                ];
                context.goNamed(GameScreen.name);
              },
              child: Text("Agregar"),
            ),
          ],
        ),
      ),
    );
  }
}
