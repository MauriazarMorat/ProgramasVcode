import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application2/entities/user.dart';
import 'package:flutter_application2/entities/game.dart';






class GameDetailScreen extends StatelessWidget {
  static const String name = 'game_detail';
  final Game selectedGame;
  const GameDetailScreen({super.key, required this.selectedGame});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedGame.name),
      ),
      body: Center(
        child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Imagen
    ClipRRect( //Crea un reactungulo con las puntas redondeadas
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        selectedGame.posterUrl,
        width: 150,
        height: 200,
        fit: BoxFit.cover, //Hace que la imagen en realidad este atras de un marco. haciendolo más redondeado
      ),
    ),

    const SizedBox(height: 16), //Un espacio entre la imagen y el texto

    // Contenedor de texto con padding
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), // Margen a los lados
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedGame.studio,
            style: const TextStyle(fontSize: 19),
          ),
          const SizedBox(height: 8),
          Text(
            selectedGame.hardDescription,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            'Pegi: ${selectedGame.pegi}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  ],
)

      ),
    );
  }
}