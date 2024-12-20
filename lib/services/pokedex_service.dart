import 'package:dio/dio.dart';
import 'package:flutter_pokedex_app/models/pokemon_detail_response.dart';
import 'package:flutter_pokedex_app/models/pokemon_list_response.dart';
import 'package:retrofit/retrofit.dart';
part 'pokedex_service.g.dart';

@RestApi()
abstract class PokedexService {
 factory PokedexService(Dio dio, {String baseUrl}) = _PokedexService;

 @GET("/pokemon?limit={20}&offset={offset}")
 Future<PokemonListResponse> getPokemonList(@Path('offset') int offset);

 @GET("/pokemon/{id}")
 Future<PokemonDetailResponse> getPokemonDetail(@Path('id') String id);

}
