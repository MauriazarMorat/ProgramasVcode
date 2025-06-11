class Game {
  String id;
  String name;
  String description;
  int pegi;
  String posterUrl;
  String studio;
  String descriptionAdvanced;
  Game({
    required this.id,
    required this.name,
    required this.description,
    required this.pegi,
    required this.posterUrl,
    required this.studio,
    required this.descriptionAdvanced,
  });
}
  final List<Game> games = [
  Game(
    id: '1',
    name: 'Minecraft',
    description: 'Construcción y supervivencia en un mundo de bloques.',
    descriptionAdvanced:
        'Minecraft es un juego de mundo abierto donde los jugadores pueden recolectar recursos, construir estructuras, y explorar mundos generados aleatoriamente. Su estilo visual basado en bloques lo hace único, y permite tanto juego libre como modos de supervivencia desafiantes. Ha sido ampliamente adoptado por comunidades educativas y de modding.',
    pegi: 7,
    posterUrl: 'https://m.media-amazon.com/images/I/81qrMVaZigL.jpg',
    studio: 'Mojang Studios',
  ),
  Game(
    id: '2',
    name: 'Half-Life 2',
    description: 'Shooter de ciencia ficción con narrativa profunda.',
    descriptionAdvanced:
        'Half-Life 2 continúa la historia del científico Gordon Freeman, enfrentado a una amenaza alienígena en un mundo distópico. Aclamado por su física avanzada, inteligencia artificial, y narrativa integrada en el juego, revolucionó los FPS modernos. Su motor Source permitió experiencias visuales y mecánicas innovadoras para la época.',
    pegi: 16,
    posterUrl: 'https://i.etsystatic.com/40271594/r/il/17de8a/6143834051/il_fullxfull.6143834051_fd87.jpg',
    studio: 'Valve',
  ),
  Game(
    id: '3',
    name: 'ULTRAKILL',
    description: 'Shooter frenético con estilo retro y sangre.',
    descriptionAdvanced:
        'ULTRAKILL es un juego de disparos inspirado en clásicos como DOOM y Quake, pero con mecánicas modernas como puntuaciones estilo arcade y movilidad extrema. Su acción rápida, niveles complejos, y banda sonora intensa lo convierten en un favorito de los fanáticos del género FPS hardcore.',
    pegi: 18,
    posterUrl: 'https://newbloodstore.com/cdn/shop/products/NBPosters_Ultrakill_2020.jpg?v=1744642917',
    studio: 'Arsi "Hakita" Patala / New Blood Interactive',
  ),
  Game(
    id: '4',
    name: 'Noita',
    description: 'Acción mágica con física de píxeles realista.',
    descriptionAdvanced:
        'Noita es un juego roguelike donde cada píxel del entorno obedece a leyes físicas. Usás hechizos personalizables para combatir enemigos y alterar el mundo. Con niveles generados aleatoriamente y una alta dificultad, ofrece una experiencia única en cada partida. Su motor físico es uno de los más innovadores del género.',
    pegi: 16,
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BZGEwZDBjODAtMGFjOS00OTZmLTg2OGItZDYyMTE3MjFmOGMyXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    studio: 'Nolla Games',
  ),
  Game(
    id: '5',
    name: 'Factorio',
    description: 'Automatizá fábricas y gestioná recursos.',
    descriptionAdvanced:
        'Factorio es un juego de construcción y gestión en el que diseñás sistemas automatizados para recolectar y procesar recursos. Empezás con herramientas básicas, pero eventualmente desarrollás enormes fábricas con logística avanzada. Su enfoque en optimización y eficiencia ha creado una base de jugadores muy dedicada.',
    pegi: 12,
    posterUrl: 'https://cdn.factorio.com/assets/img/artwork/factorio-cover.png',
    studio: 'Wube Software',
  ),
];


