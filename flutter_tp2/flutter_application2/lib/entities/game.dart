import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  int id;
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



