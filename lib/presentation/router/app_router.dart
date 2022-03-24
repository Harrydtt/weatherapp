import 'package:flutter/material.dart';

import 'package:weather_app/presentation/home/view/home_screen.dart';
import 'package:weather_app/presentation/explore/view/explore_screen.dart';
import 'package:weather_app/presentation/store/view/store_screen.dart';
import 'package:weather_app/presentation/user/view/user_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/explore':
        return MaterialPageRoute(builder: (_) => const ExplorePage());
      case '/store':
        return MaterialPageRoute(builder: (_) => const StorePage());
      case '/user':
        return MaterialPageRoute(builder: (_) => const UserPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
