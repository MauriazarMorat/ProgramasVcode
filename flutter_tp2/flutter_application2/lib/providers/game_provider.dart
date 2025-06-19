import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application2/entities/game.dart';

StateProvider<List<Game>> gamesProvider = StateProvider((ref)=>[
  Game(
  id: 1,
  name: 'Minecraft',
  description: 'Un juego de construcción y supervivencia en un mundo abierto de bloques.',
  hardDescription: 'Minecraft es un juego sandbox en el que los jugadores pueden explorar mundos generados proceduralmente, recolectar recursos, fabricar herramientas y construir estructuras de cualquier tipo. Su modo supervivencia pone a prueba tu ingenio y creatividad mientras combatís criaturas hostiles y administrás recursos limitados.',
  pegi: "7",
  posterUrl: 'https://m.media-amazon.com/images/I/81qrMVaZigL.jpg',
  studio: 'Mojang Studios',
),

Game(
  id: 2,
  name: 'Half-Life 2',
  description: 'Un shooter de ciencia ficción en primera persona con una historia inmersiva.',
  hardDescription: 'Half-Life 2 combina una narrativa compleja con mecánicas de disparo precisas en un mundo distópico gobernado por una fuerza alienígena. Acompañás a Gordon Freeman mientras se une a la resistencia humana en una lucha desesperada por la libertad, todo impulsado por un motor físico revolucionario para su época.',
  pegi: "16",
  posterUrl: 'https://i.etsystatic.com/40271594/r/il/17de8a/6143834051/il_fullxfull.6143834051_fd87.jpg',
  studio: 'Valve',
),

Game(
  id: 3,
  name: 'ULTRAKILL',
  description: 'Un shooter retro ultraviolento y frenético inspirado en los 90s.',
  hardDescription: 'ULTRAKILL es una explosiva combinación de acción intensa, sangre y velocidad pura. Inspirado en clásicos como DOOM y Quake, te sumerge en una carnicería sangrienta contra hordas demoníacas mientras te impulsás por el aire, encadenás combos brutales y luchás por puntuaciones altas en niveles que exigen reflejos de acero.',
  pegi: "18",
  posterUrl: 'https://newbloodstore.com/cdn/shop/products/NBPosters_Ultrakill_2020.jpg?v=1744642917',
  studio: 'Arsi "Hakita" Patala / New Blood Interactive',
),

Game(
  id: 4,
  name: 'Noita',
  description: 'Un roguelike de acción mágica donde cada píxel es físicamente simulado.',
  hardDescription: 'Noita es un roguelike único donde controlás a un hechicero en un mundo donde cada píxel reacciona a la física: líquidos fluyen, explosiones destruyen entornos y reacciones químicas pueden matarte en segundos. Cada partida es diferente y desafiante, con un profundo sistema de hechizos personalizables.',
  pegi: "16",
  posterUrl: 'https://m.media-amazon.com/images/M/MV5BZGEwZDBjODAtMGFjOS00OTZmLTg2OGItZDYyMTE3MjFmOGMyXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
  studio: 'Nolla Games',
),

Game(
  id: 5,
  name: 'Factorio',
  description: 'Un juego de simulación de fábricas donde automatizás la producción de recursos.',
  hardDescription: 'Factorio es un complejo juego de estrategia y automatización donde diseñás y mantenés fábricas gigantescas en un mundo alienígena. Desde la extracción de recursos hasta la defensa de tu base, cada decisión afecta la eficiencia de tu producción, lo que lo convierte en una experiencia adictiva para mentes lógicas y planificadoras.',
  pegi: "12",
  posterUrl: 'https://cdn.factorio.com/assets/img/artwork/factorio-cover.png',
  studio: 'Wube Software',
),

]);

