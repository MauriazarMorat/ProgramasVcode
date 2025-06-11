import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter_application2/screens/login_screen.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: LoginScreen.name,
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: GameScreen.name,
      path: '/game',
      builder: (context, state) => GameScreen(userName: state.extra as String),
      ),
       GoRoute(
      name: GameDetailScreen.name,
      path: '/game_detail',
      builder: (context, state) => GameDetailScreen(selectedGame: state.extra as Game),
      )
  ],

);