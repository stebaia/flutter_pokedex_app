import 'package:auto_route/auto_route.dart';
import 'package:flutter_pokedex_app/router/app_router.gr.dart';



@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter{

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: DetailPokemonRoute.page, ),
  ];

}