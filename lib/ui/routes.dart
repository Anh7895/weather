import 'package:flutter/material.dart';
import 'package:weather/isolate.dart';
import 'package:weather/ui/search/search_screen.dart';
import 'package:weather/ui/splash/splash_screen.dart';

import '../common/config/routers_name.dart';
import 'dashboard/dashboard_screen.dart';
import 'home/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.searchScreen:
        return MaterialPageRoute(
            builder: (_) => SearchScreen(),
            settings: const RouteSettings(name: RouteName.searchScreen));
      case RouteName.loginScreen:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(),
            settings: const RouteSettings(name: RouteName.loginScreen));
      case RouteName.MyApp:
        return MaterialPageRoute(
            builder: (_) => MyApp(),
            settings: const RouteSettings(name: RouteName.MyApp));
      case RouteName.dashboard:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen(),
            settings: const RouteSettings(name: RouteName.dashboard));
      case RouteName.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
            settings: const RouteSettings(name: RouteName.splashScreen));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> _getCombinedRoutes() => {};

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}
