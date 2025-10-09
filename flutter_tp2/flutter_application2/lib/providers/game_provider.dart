import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final gameProvider = StateNotifierProvider<GameNotifier, List<Game>>(
  (ref) => GameNotifier(FirebaseFirestore.instance),
);

class GameNotifier extends StateNotifier<List<Game>> {
  final FirebaseFirestore db;

  GameNotifier(this.db) : super([]);

  Future<void> addGame(Game game) async {
    final doc = db.collection('games').doc(); //Con esto nos paramos en el doc entero. 
    try {
      game.id = doc.id;
      await doc.set(game.toFirestore());
      state = [...state, game];
    } catch (e) {
      print(e);
    }
  }

  Future<void> editGame(Game editedgame) async {
    //Aprendi que era una query y al final no uso eso..

    final doc= db.collection('games').doc(editedgame.id);  //Hacemos un doc nuevo
    try {
      
      await doc.set(editedgame.toFirestore()); //Lo setamos Parandonos encima del documento

      final gamelist = [...state];  //hay que CLONARRR la lista, porque si la copiamos normal es una referencia y aparemente no es lo mismo que clonar asi que...
      final index = gamelist.indexWhere((g) => g.id == editedgame.id); //Buscamos el indice del juego a editar
      gamelist[index] = editedgame; //Usamos el indice 
      state = gamelist;

    } catch (e) {
      print(e);
    }
  }
  
  Future<void> deleteGame(Game selectedgame) async {
  final query = await db.collection('games').where('id', isEqualTo: selectedgame.id).get();
  try{
      final doc = query.docs.first.reference;
      await doc.delete();

      final gamelist = [...state];  //hay que CLONARRR la lista, porque si la copiamos normal es una referencia y aparemente no es lo mismo que clonar asi que...
      final index = gamelist.indexWhere((g) => g.id == selectedgame.id); //Buscamos el indice del juego a editar
      gamelist.removeAt(index); //Usamos el indice 
      state = gamelist;
      }catch (e){
    print(e);
  }
  
  
    }
  //Tenemos que sortear porque adentro de la firestorgae esta todo desordeado porque tienen ID internos.
  //Entonces hacemos un sort para que se vea mejor cuando en relaidad no importa.
  Future<void> getAllGames() async {
    final docs = db.collection('games').withConverter(
        fromFirestore: Game.fromFirestore,
        toFirestore: (Game game, _) => game.toFirestore());
    final games = await docs.get();
    state = games.docs.map((d) => d.data()).toList();
    
  }
}