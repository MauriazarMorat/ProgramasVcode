import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameEditScreen extends StatelessWidget{
static const String name = 'game_edit';
final int givenId;
const  GameEditScreen({super.key, required this.givenId});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Editar Juego'),
      ),
      body: _GamesEdit(givenId: givenId),
      
    );
  }
}
class _GamesEdit extends ConsumerWidget {
  final int givenId;
  _GamesEdit({required this.givenId});

  final TextEditingController ngName = TextEditingController();
  final TextEditingController ngDescription = TextEditingController();
  final TextEditingController ngHardDescription = TextEditingController();
  final TextEditingController ngPegi = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final gameList = ref.watch(gamesProvider);
    Game selectedGame = gameList.firstWhere((game) => game.id == givenId);

    ngName.text = selectedGame.name;
    ngDescription.text = selectedGame.description;
    ngHardDescription.text = selectedGame.hardDescription;
    ngPegi.text = selectedGame.pegi.toString(); // <- convertí a String si es int

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                selectedGame.posterUrl,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                 'assets/GenericGamePoster.jpg', // Ruta a tu imagen local
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                 'assets/GenericGamePoster.jpg', // Ruta a tu imagen local
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                  );
                },
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: ngName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cambiar nombre",
              ),
            ),
            SizedBox(height: 30),
            TextField(
              minLines: 3,
              maxLines: 5,
              controller: ngDescription,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cambiar minidescripción",
              ),
            ),
            SizedBox(height: 30),
            TextField(
              minLines: 5,
              maxLines: 8,
              controller: ngHardDescription,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cambiar descripción",
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: ngPegi,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cambiar PEGI",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                int index = gameList.indexWhere((game) => game.id == selectedGame.id);

                Game editedGame = Game(
                  id: selectedGame.id,
                  name: ngName.text,
                  description: ngDescription.text,
                  hardDescription: ngHardDescription.text,
                  pegi:ngPegi.text,
                  posterUrl: selectedGame.posterUrl,
                  studio: selectedGame.studio,
                );

                final nuevaLista = [...gameList];
                nuevaLista[index] = editedGame;
                ref.read(gamesProvider.notifier).state = nuevaLista;

                context.goNamed(GameScreen.name);
              },
              child: Text("Editar"),
            ),
          ],
        ),
      ),
    );
  }
}
