part of 'dependecy_injector.dart';

List<Provider> get _providers => [
  Provider<Logger>(create: (context) => Logger()), 
  Provider<Dio>(create: (context) => Dio()),
  
  Provider<PokedexService>(create: (context) => PokedexService(context.read(), baseUrl: 'https://pokeapi.co/api/v2')),
];