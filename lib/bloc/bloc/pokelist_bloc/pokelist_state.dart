part of 'pokelist_bloc.dart';


abstract class PokelistState extends Equatable {}

class PokelistInitial extends PokelistState {
  @override
  List<Object?> get props => [];
}

class PokelistLoading extends PokelistState {
  @override
  List<Object?> get props => [];
}

class PokelistLoaded extends PokelistState {
  final List<PokemonListResults> pokemonList;

  PokelistLoaded(this.pokemonList);

  @override
  List<Object?> get props => [pokemonList];
}

class PokelistError extends PokelistState {
  final String message;

  PokelistError(this.message);

  @override
  List<Object?> get props => [message];
}