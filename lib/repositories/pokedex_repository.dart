import 'package:flutter_pokedex_app/models/pokemon_detail_response.dart';
import 'package:flutter_pokedex_app/models/pokemon_list_response.dart';
import 'package:flutter_pokedex_app/services/pokedex_service.dart';
import 'package:logger/logger.dart';

class PokedexRepository {
  final Logger logger;
  final PokedexService pokedexService;

  PokedexRepository(this.logger, this.pokedexService);

  Future<PokemonListResponse> getPokemonList(int offset) async {
    try {
      final PokemonListResponse pokemonListResponse =
          await pokedexService.getPokemonList(offset);
      PokemonListResponse mappedPokemonListResponse = PokemonListResponse(
        previous: pokemonListResponse.previous,
        next: pokemonListResponse.next,
        count: pokemonListResponse.count,
        results: [],
      );
      for (final (index, PokemonListResults pokemonListResults) in pokemonListResponse.results!.indexed) {
        
        final number = pokemonListResponse.results![index].url!.split('/').reversed.skip(1).first;  // "13"

        mappedPokemonListResponse.results!.add(PokemonListResults(
          name: pokemonListResults.name,
          url: pokemonListResults.url,
          image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${number}.gif"
          
        ));
      }
      logger.i('PokemonListResponse: ${pokemonListResponse.toJson()}');
      return mappedPokemonListResponse;
    } catch (e) {
      logger.e('Errore nel recupero dei pokemon');
      rethrow;
    }
  }

  Future<PokemonDetailResponse> getPokemonDetail(String id) async {
    try {
      final PokemonDetailResponse pokemonDetailResponse =
          await pokedexService.getPokemonDetail(id);
      logger.i('PokemonListResponse: ${pokemonDetailResponse.toJson()}');
      return pokemonDetailResponse;
    } catch (e) {
      logger.e('Errore nel recupero del pokemon con id : $id');
      rethrow;
    }
  }
}
