import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/di/dependecy_injector.dart';
import 'package:flutter_pokedex_app/router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) => DependecyInjector(child: MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerDelegate: _router.delegate(),
    routeInformationParser: _router.defaultRouteParser(),
  ));
}