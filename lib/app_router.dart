import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/constants/strings.dart';
import 'package:pokemon_app/data/web_services/api_calls.dart';
import 'package:pokemon_app/presentation/screens/characters_details.dart';
import 'package:pokemon_app/presentation/screens/characters_screen.dart';

import 'business_logic/characters_bloc.dart';
import 'data/repository/characters_repository.dart';



class AppRouter {
  late CharacterRepository characterRepository;//instance for CharacterRepository
  late CharactersBloc charactersBloc;//instance for CharactersBloc
  AppRouter() {
    characterRepository=CharacterRepository();
    charactersBloc=CharactersBloc(characterRepository);

  }

  Route? generateRoutes(RouteSettings settings){
    //final Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
     switch(settings.name){
       case characterScreen:
         return MaterialPageRoute(builder: (_) =>BlocProvider(
           create: (BuildContext context)=>charactersBloc,
           child: CharacterScreen(),),);
         /*
         create take a build context and  returns an instance of the BLoC. Here, it is returning the charactersBloc instance.
         charactersBloc is an instance of CharactersBloc which is assumed to be already created or provided earlier in your code.
         It allows CharacterScreen and its descendants to access the charactersBloc.
          */

       case characterDetails:
         return MaterialPageRoute(builder: (_) =>CharacterDetails());
     }
  }
}
