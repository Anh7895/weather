import 'package:flutter/material.dart';
import 'package:weather/ui/splash/splash_screen.dart';

import '../common/config/routers_name.dart';
import 'dashboard/dashboard_screen.dart';
import 'home/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(),
            settings: const RouteSettings(name: RouteName.loginScreen));
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
