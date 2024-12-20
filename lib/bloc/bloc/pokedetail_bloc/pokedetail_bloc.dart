import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex_app/models/pokemon_detail_response.dart';
import 'package:flutter_pokedex_app/repositories/pokedex_repository.dart';

part 'pokedetail_event.dart';
part 'pokedetail_state.dart';

class PokemonDetailBloc 
    extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokedexRepository pokemonRepository;

  PokemonDetailBloc({required this.pokemonRepository})
      : super(const FetchingPokemonDetailState()) {
    on<FetchPokemonDetailEvent>(_fetchPokemonDetail);
  }

  void fetchPokemonDetail(String id) =>
      add(FetchPokemonDetailEvent(id));

  FutureOr<void> _fetchPokemonDetail(
      FetchPokemonDetailEvent event,
      Emitter<PokemonDetailState> emit) async {
    emit(const FetchingPokemonDetailState());
    try {
      final pokemonDetail = await pokemonRepository
          .getPokemonDetail(event.id);
      emit(FetchedPokemonDetailState(pokemonDetail));
    } catch (error) {
      emit(const ErrorPokemonDetailState());
    }
  }
}