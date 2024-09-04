// Ensure this is the correct path and file where your repository is defined.
import 'package:dio/dio.dart';
import '../models/pokemon.dart';

class CharacterRepository {
  final Dio dio = Dio(); // Using Dio for HTTP requests

  Future<List<Map<String, dynamic>>> fetchAllPokemon() async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon?limit=50'); // Fetch 50 Pokémons

    if (response.statusCode == 200) {
      final results = response.data['results'] as List;

      List<Map<String, dynamic>> allPokemon = [];
      for (var result in results) {
        final pokemonResponse = await dio.get(result['url']);
        if (pokemonResponse.statusCode == 200) {
          allPokemon.add(pokemonResponse.data);
        }
      }

      return allPokemon; // Returning list of Pokemon data
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}























/*
import '../web_services/api_calls.dart';

class CharacterRepository {
  final PokemonService pokemonService;

  CharacterRepository(this.pokemonService);

  // Fetch all Pokémon data
  Future<List<Map<String, dynamic>>> fetchAllPokemon() async {
    return await pokemonService.fetchAllPokemon();
  }
}

 */
















/*
import '../web_services/api_calls.dart';

class CharacterRepository{
  late PokemonService pokemonService;//i create an instance object of PokemonService API

CharacterRepository(this.pokemonService);//constructor

   // i create a method same return as the method inside api_calls where we fetch data using api.
  Future<Map<String, dynamic>> fetchPokemonDetails(String pokemonName) async {
    // we add the name of pokemon to used down
    final characters= await pokemonService.fetchPokemonDetails(pokemonName);
    // i use the the instance to use the method to get their return.
    return characters;
  }
}

 */