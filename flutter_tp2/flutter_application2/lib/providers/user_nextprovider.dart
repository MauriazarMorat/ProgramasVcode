import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application2/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, List<User>>(
  (ref) => UserNotifier(FirebaseFirestore.instance),
);


class UserNotifier extends StateNotifier<List<User>> {
  final FirebaseFirestore db;

  UserNotifier(this.db) : super([]);


  Future<void> getAllGames() async {
    final docs = db.collection('users').withConverter(
        fromFirestore: User.fromFirestore,
        toFirestore: (User user, _) => user.toFirestore());
    final users = await docs.get();
    final prestate = users.docs.map((d) => d.data()).toList();
    state = prestate;
  }
}