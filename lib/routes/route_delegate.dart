import 'package:flutter/material.dart';
import 'package:graduate_thesis/routes/route_names.dart';
import '../screens/authentication_screen/sign_in_screen.dart';
import '../screens/generate_password/generate_password_homepage.dart';
import '../screens/home_screen/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings path) {
    String routePath = path.name ?? '';
    Widget _screenFor(String route) {
      if (route == homeRoute) {
        return HomeScreen();
      }
      if (route == generatePasswordRoute) {
        return GeneratePasswordScreen();
      }
      if (route == signInRoute) {
        return SignInScreen();
      }
      return Container();
    }

    return MaterialPageRoute(builder: (_) => _screenFor(routePath));
  }
}
