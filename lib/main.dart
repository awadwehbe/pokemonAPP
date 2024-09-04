import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(PokemonApp(appRouter: AppRouter()));//never forget to add the appRouter: AppRouter() here.
}

class PokemonApp extends StatelessWidget {
  final AppRouter appRouter;//first i create the object appRoute of type AppRouter
  const PokemonApp({super.key, required this.appRouter});//second i create the constructor to hold object.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove the debug banner
      onGenerateRoute: appRouter.generateRoutes,//using method inside AppRouter.

    );
  }
}
