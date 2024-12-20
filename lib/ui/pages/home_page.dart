import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex_app/bloc/bloc/pokelist_bloc/pokelist_bloc.dart';
import 'package:flutter_pokedex_app/models/pokemon_list_response.dart';
import 'package:flutter_pokedex_app/router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  HomePage({super.key});

  final List<PokemonListResults> _listOfPokemon = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokelistBloc, PokelistState>(
        builder: (context, state) {
          if (state is PokelistLoaded) {
            _listOfPokemon.addAll(state.pokemonList);
            context.read<PokelistBloc>().isLoading = false;
          } else if (state is PokelistLoading && _listOfPokemon.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: _listOfPokemon.length,
                  controller: _scrollController
                    ..addListener(() {
                      if (_scrollController.offset ==
                              _scrollController.position.maxScrollExtent &&
                          !context.read<PokelistBloc>().isLoading) {
                        context.read<PokelistBloc>().fetchPokemonList();
                      }
                    }),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(_listOfPokemon[index].name ?? ''),
                          Image.network(_listOfPokemon[index].image ?? ''),
                        ],
                      ),
                    );
                    
                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                ),
              ),
              state is PokelistLoading
                  ? Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokelistBloc(pokedexRepository: context.read())
              ..fetchPokemonList(),
          ),
        ],
        child: this,
      );
}
