part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}

class FetchAllCharacters extends CharactersEvent {}




/*
part of 'characters_bloc.dart';


@immutable
sealed class CharactersEvent {}

class FetchCharacterDetails extends CharactersEvent {
  final String pokemonName;

  FetchCharacterDetails(this.pokemonName);
}


 */

