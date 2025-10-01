import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  String id;
  String name;
  String description;
  String hardDescription;
  String pegi;
  String posterUrl;
  String studio;
  
  Game({
    required this.id,
    required this.name,
    required this.description,
    required this.hardDescription,
    required this.pegi,
    required this.posterUrl,
    required this.studio,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'id' : id,
      'name' : name,
      'description': description,
      'hardDescription': hardDescription,
      'pegi': pegi,
      'posterUrl': posterUrl,
      'studio': studio
      
    };
  }

  static Game fromFirestore(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? options,
) {
  final data = snapshot.data();

  return Game(
    id: data?['id'],
    name: data?['name'],
    description: data?['description'],
    hardDescription: data?['hardDescription'],
    pegi: data?['pegi'],
    posterUrl: data?['posterUrl'],
    studio: data?['studio'],
  );
}

}

final game1 = Game(
  id: "0",
  name: "Minecraft",
  description: "Explora y construye mundos.",
  hardDescription: "Construye estructuras y explora biomas infinitos con amigos o solo.",
  pegi: "7",
  posterUrl: "https://m.media-amazon.com/images/I/71zd3aAZWlL.jpg",
  studio: "Mojang",
);

final game2 = Game(
  id: "0",
  name: "Half-Life 2",
  description: "Continúa la aventura de Gordon Freeman.",
  hardDescription: "Combate alienígenas y resuelve puzzles en City 17.",
  pegi: "16",
  posterUrl: "https://i.redd.it/halflife-2-cinematic-poster-concept-teasers-v0-nga27d29ttbc1.jpg?width=1372&format=pjpg&auto=webp&s=f837365c77647098d20eccdf4d8a78a3aabeb27b",
  studio: "Valve",
);

final game3 = Game(
  id: "0",
  name: "Ultrakill",
  description: "Acción frenética y rápida.",
  hardDescription: "Dispara sin parar y derrota hordas de enemigos demoníacos.",
  pegi: "18",
  posterUrl: "https://i.redd.it/48481e497spb1.jpg",
  studio: "Arsi 'Hakita' Patala",
);

final game4 = Game(
  id: "0",
  name: "Team Fortress 2",
  description: "Shooter por equipos divertido.",
  hardDescription: "Elige entre diferentes clases y colabora con tu equipo para ganar partidas.",
  pegi: "12",
  posterUrl: "https://external-preview.redd.it/fSHOwGtu_Rg1z6bSy5xvWvf1oqS1GTBcfii4gIN4zwA.jpg?width=640&crop=smart&auto=webp&s=2e8b7f7089e0253c157f74d76b42edf418b7f092",
  studio: "Valve",
);

final game5 = Game(
  id: "0",
  name: "Counter-Strike",
  description: "Shooter táctico competitivo.",
  hardDescription: "Enfrenta terroristas y contra-terroristas en partidas estratégicas.",
  pegi: "16",
  posterUrl: "https://m.media-amazon.com/images/I/61nn8yv5G+L._UF894,1000_QL80_.jpg",
  studio: "Valve",
);
