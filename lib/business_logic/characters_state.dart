part of 'characters_bloc.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharacterLoaded extends CharactersState {
  final List<Map<String, dynamic>> allPokemon;

  CharacterLoaded({required this.allPokemon});
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError(this.message);
}



/*
part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharacterLoaded extends CharactersState {
  final Map<String, dynamic> pokemonData; // Final property for holding map data

  // Constructor to initialize the pokemonData property
  CharacterLoaded({required this.pokemonData});
}
class CharactersError extends CharactersState {
  final String error;

  CharactersError(this.error);
}
/*
1-Define a Property for Pokémon Data: Add a final property pokemonData of type Map<String,
dynamic> to the CharacterLoaded class. This property will store the fetched Pokémon data.


2-Add a Constructor: Create a constructor for CharacterLoaded that requires the pokemonData map
as an argument. Using the required keyword ensures that the map is always provided when creating
an instance of this state.
 */

 */

