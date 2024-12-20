part of 'pokelist_bloc.dart';

sealed class PokelistEvent extends Equatable {}

class FetchPokemonList extends PokelistEvent {

  FetchPokemonList();
  
  @override
  List<Object?> get props => [];


}