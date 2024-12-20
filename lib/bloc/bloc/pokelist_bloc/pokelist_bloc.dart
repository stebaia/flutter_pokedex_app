import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex_app/models/pokemon_list_response.dart';
import 'package:flutter_pokedex_app/repositories/pokedex_repository.dart';

part 'pokelist_event.dart';
part 'pokelist_state.dart';

class PokelistBloc extends Bloc<PokelistEvent, PokelistState> {
  PokelistBloc({
    required this.pokedexRepository,
  }) : super(PokelistInitial()) {
    on<FetchPokemonList>(_fetchPokemonList);
  }

  void fetchPokemonList() => add(FetchPokemonList());

  PokedexRepository pokedexRepository;

  int offset = 0;
  bool isLoading = false;

  FutureOr<void> _fetchPokemonList(
      FetchPokemonList event, Emitter<PokelistState> emit) async {
    emit(PokelistLoading());
    try {
      final pokeListResponse = await pokedexRepository.getPokemonList(offset);
      if (pokeListResponse.results!.isNotEmpty &&
          pokeListResponse.next != null) {
        offset += 20;
        emit(PokelistLoaded(pokeListResponse.results!));
      } else {
        emit(PokelistLoaded([]));
      }
    } catch (e) {
      emit(PokelistError(e.toString()));
    }
  }
}
