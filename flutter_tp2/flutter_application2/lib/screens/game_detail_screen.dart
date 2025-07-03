import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/providers/user_provider.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_add_screen.dart';
import 'package:flutter_application2/screens/game_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameDetailScreen extends ConsumerWidget {
  static const String name = 'game_detail';
  final Game selectedGame;

  const GameDetailScreen({super.key, required this.selectedGame});

  


  @override
  Widget build(BuildContext context,ref) {
    final TextEditingController ngName = TextEditingController(text: selectedGame.name);
  final TextEditingController ngDescription = TextEditingController(text: selectedGame.description);
  final TextEditingController ngPegi = TextEditingController(text: selectedGame.pegi);
  final TextEditingController ngHardDescription = TextEditingController(text: selectedGame.hardDescription);
  final TextEditingController ngStudio = TextEditingController(text: selectedGame.studio);
  final TextEditingController ngPosterUrl = TextEditingController(text: selectedGame.posterUrl);
  bool blocked = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedGame.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16), // Aquí va el padding
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Imagen
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
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                  );
                },
                  ),
                ),

                 SizedBox(height: 16),

                // Contenedor de texto con padding interno adicional
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
              width: 200,
              child: TextField(
                readOnly: blocked,
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
                readOnly: blocked,
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
                readOnly: blocked,
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
                readOnly: blocked,
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
                readOnly: blocked,
                controller: ngPosterUrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Poster Url",
                ),
              ),
            ),
            SizedBox(height: 50,),

            SizedBox(
              width: 200,
              child: TextField(
                readOnly: blocked,
                controller: ngPegi,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Su pegi",
                ),
              ),
            ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ), // padding
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed:()
      {
        blocked = !blocked;
      },child: Icon(Icons.edit),
      ),
      FloatingActionButton(onPressed:()
      {

         Navigator.of(context).pop(); // Para cerrarlolo
        _gameDelete(context,ref,selectedGame.id,);
      },child: Icon(Icons.delete),
      ),
      ], ///children
      )
      
      
      
    ); //scaffold 
  }
}

void _gameDelete(BuildContext context,ref, int givenId){

final List<Game> gameList = ref.watch(gamesProvider);
Game selectedGame = gameList.firstWhere((game) => game.id == givenId);
int index = gameList.indexWhere((game) => game.id == selectedGame.id);

List<Game> nuevaLista = [...gameList];
nuevaLista.removeAt(index);
ref.read(gamesProvider.notifier).state = [...nuevaLista];

}
