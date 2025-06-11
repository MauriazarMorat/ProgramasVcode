import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/user.dart';
import 'package:flutter_application2/entities/game.dart';


class GameScreen extends StatelessWidget {
  static const String name = 'game';
  final String userName;
  final List<Game> gameList = games;
  GameScreen({super.key, required this.userName});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Welcome $userName'),
      ),
      body: _GamesView(gameList: gameList),
    );
  }
}

class _GamesView extends StatelessWidget{
  final List<Game> gameList;

  const _GamesView({super.key, required this.gameList});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameList.length,
      itemBuilder: (context, index) {
        final game = gameList[index];
        return GestureDetector(
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
