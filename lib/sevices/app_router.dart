import 'package:flutter/material.dart';
import 'package:todo/screens/recycle_bin.dart';
import 'package:todo/screens/tabs_screen.dart';

class AppRouter {
  Route? onGerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
      default:
        return null;
    }
  }
}
