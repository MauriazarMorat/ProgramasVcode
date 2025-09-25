import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final gameNewProvider = StateNotifierProvider<GameNewNotifier, List<Game>>(
  (ref) => GameNewNotifier(FirebaseFirestore.instance),
);

class GameNewNotifier extends StateNotifier<List<Game>> {
  final FirebaseFirestore db;

  GameNewNotifier(this.db) : super([]);

  Future<void> addGame(Game game) async {
    final doc = db.collection('games').doc();
    try {
      await doc.set(game.toFirestore());
      state = [...state, game];
    } catch (e) {
      print(e);
    }
  }

  Future<void> editGame(Game game) async {
    final doc = db.collection('games').doc();
    try {
      await doc.set(game.toFirestore());
      state = [...state, game];
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllGames() async {
    final docs = db.collection('games').withConverter(
        fromFirestore: Game.fromFirestore,
        toFirestore: (Game game, _) => game.toFirestore());
    final games = await docs.get();
    state = [...state, ...games.docs.map((d) => d.data())];
  }
}