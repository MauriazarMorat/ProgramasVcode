import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/providers/user_provider.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_add_screen.dart';
import 'package:flutter_application2/screens/game_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  static const String name = 'game';
  
 const  GameScreen({super.key});
  
  @override
  Widget build(BuildContext context,ref) {
    final userName = ref.watch(userProvider);
    final gameList = ref.watch(gamesProvider);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Welcome $userName'),
      ),
      body: _GamesView(),
      floatingActionButton: FloatingActionButton(onPressed:()
      {
        _goToGameAdd(context,gameList.length);
      },child: Icon(Icons.add),),
    );
  }
}

class _GamesView extends ConsumerWidget{
  const _GamesView();
  @override
  Widget build(BuildContext context,ref) {
    final gameList = ref.watch(gamesProvider);
    return ListView.builder(
      itemCount: gameList.length,
      itemBuilder: (context, index) {
        final game = gameList[index];
        return GestureDetector(
          onLongPress: () {
            showModalBottomSheet(context: context, builder: (context){
              return Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("editar"),
                    onTap: (){
                      Navigator.of(context).pop(); //Cierra el modalbottomsheet
                       _goToGameEdit(context,game.id);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text("Eliminar"),
                    onTap: (){
                      Navigator.of(context).pop(); // Para cerrarlolo
                       _gameDelete(context,ref,game.id,);
                    },
                  )
                ],
              );
            });
          },
          onTap: (){
            _goToGameDetails(context,game);
          }, //Card crea las targetitas
          child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //Esto es el margen de cada una, Esto hace que los bordeas sean simetricos y ademas alla u espaciado entre cada una
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Padding( //Esto es un reborde
          padding: EdgeInsets.all(4), //Rebordes hacia adentro de 4
          child: Row(
            children: [
              ClipRRect( //Crea un reactangulo con bordes redondeados
                borderRadius: BorderRadius.circular(4), //redondea los bordes 
                child: Image.network( //la funciona que busca la image
                  game.posterUrl, //imagen
                  width: 100, //achura
                  height: 150, //altura
                )
              ),SizedBox(width: 12,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(game.name,
                  style: TextStyle(fontSize: 24),
                  ),
                  Text(game.studio,
                  style: TextStyle(fontSize: 19),
                  ),
                  
                  Text(game.description,
                  style: TextStyle(fontSize: 18),
                  ),
                   Text('Pegi: ${game.pegi}',
                  style: TextStyle(fontSize: 16),
                  ),
                  
                ],
              ))
            ],
          )
          ),
        )
        );
      },
    );
}
}

void _goToGameDetails(BuildContext context, Game game){
  context.pushNamed(GameDetailScreen.name,extra: game,);
}

void _goToGameAdd(BuildContext context, int id){
  context.pushNamed(GameAddScreen.name,extra: id,);
}

void _goToGameEdit(BuildContext context, int id){
  context.pushNamed(GameEditScreen.name,extra: id,);
}

void _gameDelete(BuildContext context,ref, int givenId){

final List<Game> gameList = ref.watch(gamesProvider);
Game selectedGame = gameList.firstWhere((game) => game.id == givenId);
int index = gameList.indexWhere((game) => game.id == selectedGame.id);

List<Game> nuevaLista = [...gameList];
nuevaLista.removeAt(index);
ref.read(gamesProvider.notifier).state = [...nuevaLista];

}
