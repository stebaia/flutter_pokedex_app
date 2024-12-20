part of 'dependecy_injector.dart';

List<RepositoryProvider> get _repositories => [
  RepositoryProvider<PokedexRepository>(create: (context) => PokedexRepository(context.read(), context.read())),
];