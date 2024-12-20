part of 'pokedetail_bloc.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object> get props => [];
}

class FetchingPokemonDetailState extends PokemonDetailState {
  const FetchingPokemonDetailState();
}

class FetchedPokemonDetailState extends PokemonDetailState {
  final PokemonDetailResponse pokemonDetail;
  const FetchedPokemonDetailState(this.pokemonDetail);

  @override
  List<Object> get props => [pokemonDetail];
}

class ErrorPokemonDetailState extends PokemonDetailState {
  const ErrorPokemonDetailState();
}