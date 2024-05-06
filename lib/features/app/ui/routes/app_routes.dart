import 'package:flutter/material.dart';
import 'package:musickeando/features/screens.dart';

class AppRoutes {
  static const initialRoute = '/checkAuth';
  //Route List
  static final routes = <Routes>[
    Routes(route: '/authentication', screen: const AuthenticationScreen()),
    Routes(route: '/home', screen: const HomeScreen()),
    Routes(route: '/checkAuth', screen: const CheckAuth()),
    Routes(route: '/results', screen: const ResultsScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final element in routes) {
      appRoutes
          .addAll({element.route: (BuildContext context) => element.screen});
    }
    return appRoutes;
  }

  static onGenerateRoute(settings) {
    return MaterialPageRoute(builder: (context) => const CheckAuth());
  }
}

class Routes {
  final String route;
  final Widget screen;

  Routes({required this.route, required this.screen});
}
