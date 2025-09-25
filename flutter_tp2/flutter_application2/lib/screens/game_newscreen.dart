import 'package:flutter_application2/providers/game_newprovider.dart';
import 'package:flutter_application2/providers/game_provider.dart';
import 'package:flutter_application2/providers/user_provider.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_add_screen.dart';
import 'package:flutter_application2/screens/game_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class GameNewScreen extends ConsumerStatefulWidget {
  static const String name = 'game_new';
 const  GameNewScreen({super.key});
  
  @override
  ConsumerState<GameNewScreen> createState() => _GameNewScreenState();
}

class _GameNewScreenState extends ConsumerState<GameNewScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(gameNewProvider.notifier).getAllGames();
  }

  @override
  Widget build(BuildContext context) {
    List<Game> gameList = ref.watch(gameNewProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Games'),
        ),
        body: _GamesView(
          gameList: gameList,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(GameAddScreen.name,extra: gameList.length,);
          },
          child: const Icon(Icons.add),
        ));
  }
}

class _GamesView extends StatelessWidget {
  List<Game> gameList;
  _GamesView({
    required this.gameList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                       context.pushNamed(GameEditScreen.name,extra: game.id,);
                    },
                  ),
                  
                ],
              );
            });
          },
          onTap: (){
            context.pushNamed(GameDetailScreen.name,extra: game,);
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
              SizedBox(width: 12,),
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
class _GameItemView extends StatelessWidget {
  final Game game;

  const _GameItemView({
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(game.name),
        subtitle: Text(game.description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).pop(); //Cierra el modalbottomsheet
          context.pushNamed(GameDetailScreen.name,extra: game.id,);
        },
      ),
    );
  }
}


