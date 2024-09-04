import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../data/repository/characters_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository repository;

  CharactersBloc(this.repository) : super(CharactersInitial()) {
    on<FetchAllCharacters>(_onFetchAllCharacters);
  }

  Future<void> _onFetchAllCharacters(
      FetchAllCharacters event, Emitter<CharactersState> emit) async {
    emit(CharactersLoading());
    try {
      final List<Map<String, dynamic>> allPokemon = await repository.fetchAllPokemon();
      emit(CharacterLoaded(allPokemon: allPokemon));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }
}

/*
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/repository/characters_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  //CharactersEvent: The type of events that trigger changes in the BLoC.
  // CharactersState: The type of states that this BLoC will emit.

  final CharacterRepository repository; // Reference to the repository
  //The BLoC has a dependency on CharacterRepository, which is a class responsible for fetching
  // character data (e.g., from an API). fetch from repository in which it fetch from API
  //bloc->repository->api->data.

  late final characters;//i add this to make return it and access it in UI.

  CharactersBloc(this.repository) : super(CharactersInitial()) {
    on<FetchCharacterDetails>(_onFetchCharacterDetails);
  }
  /*
  The constructor takes a CharacterRepository instance (this.repository).
It calls the super() constructor to set the initial state of the BLoC to CharactersInitial.
CharactersInitial is a state class that represents the initial state of the BLoC when no events have been processed yet.

on<FetchCharacterDetails>(_onFetchCharacterDetails);
This line registers an event handler _onFetchCharacterDetails for the FetchCharacterDetails event.
Whenever a FetchCharacterDetails event is added to this BLoC, the _onFetchCharacterDetails function will be called to handle the event.
   */

  Future<dynamic> _onFetchCharacterDetails(FetchCharacterDetails event,
      Emitter<CharactersState> emit) async {
    /*
    This method is an event handler for the FetchCharacterDetails event.
It takes two parameters:
event: The FetchCharacterDetails event instance that triggered this handler.
emit: The function used to emit new states from the BLoC.
     */

    try {
      // Fetch data from the repository
      final data = await repository.fetchPokemonDetails(event.pokemonName);

      // Emit the loaded state with the fetched data
      emit(CharacterLoaded(pokemonData: data));//repository.characters it is a way without event use
      this.characters=data;
    } catch (e) {
      emit(CharactersError(e.toString()));

    }
    return characters;
  }
  /*
  The try block is used to attempt fetching the character details using the CharacterRepository.
repository.fetchPokemonDetails(event.pokemonName) calls the repository method to fetch Pokémon details based on the pokemonName
provided in the event.
If fetching is successful, the fetched data (data) is emitted as a new state, CharacterLoaded, which contains the pokemonData.
If an error occurs during the fetching process, the catch block captures the exception and emits a CharactersError state with the
error message.
   */

}

//the bloc get the data from repository
/*
so api give data to repository and repository give data to the bloc

Map<String, dynamic> fetchPokemonDetails(String pokemonName)  {// no need to async or await or future , the data is in repository
    characterRepository.fetchPokemonDetails(pokemonName).then((characters){
      emit(CharacterLoaded(characters));
    });
  }

 */
 */