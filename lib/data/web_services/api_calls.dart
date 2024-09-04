import 'package:dio/dio.dart';

class PokemonService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  // Function to fetch all Pokémon
  Future<List<Map<String, dynamic>>> fetchAllPokemon() async {
    try {
      Response response = await _dio.get('${baseUrl}?limit=100');

      if (response.statusCode == 200) {
        List results = response.data['results'];

        // Fetch details of each Pokémon
        List<Map<String, dynamic>> allPokemonDetails = [];
        for (var result in results) {
          final pokemonDetails = await fetchPokemonDetails(result['name']);
          allPokemonDetails.add(pokemonDetails);
        }

        return allPokemonDetails;
      } else {
        throw Exception('Failed to load Pokémon data');
      }
    } catch (e) {
      throw Exception('Error fetching Pokémon data: $e');
    }
  }

  // Function to fetch Pokémon details
  Future<Map<String, dynamic>> fetchPokemonDetails(String pokemonName) async {
    try {
      Response response = await _dio.get('$baseUrl$pokemonName');

      if (response.statusCode == 200) {
        final data = response.data;
        return {
          'name': data['name'],
          'imageUrl': data['sprites']['front_default'],
          'height': data['height'],
          'weight': data['weight'],
          'types': (data['types'] as List)
              .map((typeInfo) => typeInfo['type']['name'] as String)
              .toList(),
        };
      } else {
        throw Exception('Failed to load Pokémon data');
      }
    } catch (e) {
      throw Exception('Error fetching Pokémon data: $e');
    }
  }
}
