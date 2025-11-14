
import 'package:flutter_application2/screens/game_screen.dart';
import 'package:flutter_application2/screens/login_screen.dart';
import 'package:flutter_application2/screens/register_screen.dart';
import 'package:flutter_application2/screens/game_detail_screen.dart';
import 'package:flutter_application2/screens/game_add_screen.dart';
import 'package:flutter_application2/screens/game_edit_screen.dart';
import 'package:flutter_application2/screens/prelogin_screen.dart';
import 'package:flutter_application2/screens/favs_screen.dart';
import 'package:flutter_application2/entities/game.dart';
import 'package:flutter_application2/screens/user_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: PreloginScreen.name,
      path:   '/',
      builder: (context, state) => const PreloginScreen(),
    ),
    GoRoute(
      name: LoginScreen.name,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: RegisterScreen.name,
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: GameScreen.name,
      path: '/game',
      builder: (context, state) => const GameScreen(),
      ),
       GoRoute(
      name: GameDetailScreen.name,
      path: '/game_detail',
      builder: (context, state) => GameDetailScreen(selectedGame: state.extra as Game),
      ),
      GoRoute(
      name: GameAddScreen.name,
      path: '/game_add',
      builder: (context, state) => GameAddScreen(givenId: state.extra as int,),
      ),
      GoRoute(
      name: GameEditScreen.name,
      path: '/game_edit',
      builder: (context, state) => GameEditScreen(givenGame: state.extra as Game,),
      ),
      GoRoute(
      name: FavsScreen.name,
      path: '/favs',
      builder: (context, state) => const FavsScreen(),
      ),
      GoRoute(
      name: UserScreen.name,
      path: '/user',
      builder: (context, state) => const UserScreen(),
      ),
      

  ],

);