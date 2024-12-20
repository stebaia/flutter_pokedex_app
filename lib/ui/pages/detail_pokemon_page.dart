import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex_app/bloc/bloc/pokedetail_bloc/pokedetail_bloc.dart';

@RoutePage()
class DetailPokemonPage extends StatelessWidget implements AutoRouteWrapper {
  const DetailPokemonPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dettaglio pokemon'),
      ),
      body: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
        builder: (context, state) {
          if (state is FetchingPokemonDetailState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchedPokemonDetailState) {
            return Center(
              child: Text(state.pokemonDetail.name!),
            );
          } else if (state is ErrorPokemonDetailState) {
            return const Text('Errore nel recupero del pokemon');
          } else {
            return const Text('Errore nel recupero del pokemon');
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PokemonDetailBloc(pokemonRepository: context.read())..fetchPokemonDetail(id),
          ),
        ],
        child: this,
      );
}
