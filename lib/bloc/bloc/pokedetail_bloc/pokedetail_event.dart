part of 'pokedetail_bloc.dart';


abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchPokemonDetailEvent extends PokemonDetailEvent {
  final String id;
  const FetchPokemonDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}