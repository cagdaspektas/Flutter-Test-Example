import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/favorites_view.dart';
import 'package:flutter_testing/presentation/home_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'model/favorites_model.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: MainScreen.route,
      builder: (context, state) {
        return const MainScreen();
      },
      routes: [
        GoRoute(
          path: FavoritesView.route,
          builder: (context, state) {
            return const FavoritesView();
          },
        ),
      ],
    ),
  ],
);

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
