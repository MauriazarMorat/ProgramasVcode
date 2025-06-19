import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/user.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application2/providers/game_provider.dart';

class GameAddScreen extends StatelessWidget{
static const String name = 'game_add';
final int givenId;
const  GameAddScreen({super.key, required this.givenId});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Añadir Juego'),
      ),
      body: _GamesAdd(givenId: givenId),
      
    );
  }
}

class _GamesAdd extends ConsumerWidget{
  final int givenId;
 _GamesAdd({super.key, required this.givenId});
  
final TextEditingController ngName =TextEditingController();
final TextEditingController ngDescription =TextEditingController();
final TextEditingController ngPegi =TextEditingController();

@override
Widget build(BuildContext context, ref) {
  return Align(
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
              
              Game newGame = Game
              (
              id: givenId+1, 
              name: ngName.text, 
              description: ngDescription.text, 
              hardDescription: ngDescription.text, 
              pegi: ngPegi.text, 
              posterUrl: "https://dbdzm869oupei.cloudfront.net/img/posters/preview/99677.png", 
              studio: "myself"
              );
              List<Game> listaNueva = ref.read(gamesProvider.notifier).state; // Estamos hacindo la lista anterior una lista, 
              ref.read(gamesProvider.notifier).state = [...listaNueva,newGame]; //Aca estamos metiendo haciendo que la nueva lista sea
              //la lista anterior + el nuevo juego
              // usar "..." es para 'desempaquetar' la lista en sus propios elemetos, en vez de meter la lista entera como su propio item
              context.goNamed(GameScreen.name);
            },
            child: Text("Agregar"),
          ),
        ],
      ),
    );
}
}