import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameEditScreen extends ConsumerStatefulWidget {
  static const String name = 'game_edit';
  final Game givenGame;
  const  GameEditScreen({super.key,required this.givenGame});
  
  @override
  ConsumerState<GameEditScreen> createState() => _GameEditScreenState();
}

class _GameEditScreenState extends ConsumerState<GameEditScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Game Edit'),
        ),
        body: _GamesEdit(
          givenGame: widget.givenGame,
        ),
        
        );
  }
}

class _GamesEdit extends ConsumerWidget {
  final Game givenGame;
  _GamesEdit({required this.givenGame});
  
  final TextEditingController ngName = TextEditingController();
  final TextEditingController ngDescription = TextEditingController();
  final TextEditingController ngHardDescription = TextEditingController();
  final TextEditingController ngPegi = TextEditingController();
  
  


  @override
  Widget build(BuildContext context, ref) {
    Game selectedGame = givenGame;

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
                
                Game editedGame = Game(
                  id: selectedGame.id,
                  name: ngName.text,
                  description: ngDescription.text,
                  hardDescription: ngHardDescription.text,
                  pegi:ngPegi.text,
                  posterUrl: selectedGame.posterUrl,
                  studio: selectedGame.studio,
                );

                ref.read(gameProvider.notifier).editGame(editedGame);

                context.pop();
              },
              child: Text("Editar"),
            ),
          ],
        ),
      ),
    );
  }
}
