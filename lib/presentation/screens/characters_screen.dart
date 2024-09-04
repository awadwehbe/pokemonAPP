import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/characters_bloc.dart'; // Ensure correct import path
import '../../data/repository/characters_repository.dart';
import '../../presentation/widgets/character_item.dart';
import '../../data/models/pokemon.dart';

class CharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersBloc(CharacterRepository())..add(FetchAllCharacters()), // Initialize the Bloc and fetch data
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokémon Characters'),
        ),
        body: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is CharactersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CharacterLoaded) {
              final List<Pokemon> characters = state.allPokemon.map((pokemonData) {
                return Pokemon.fromJson(pokemonData);
              }).toList(); // Convert Map to Pokemon objects

              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return CharacterItem(pokemon: characters[index]);
                },
              );
            } else if (state is CharactersError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

