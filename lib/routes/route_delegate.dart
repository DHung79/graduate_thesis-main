import 'package:flutter/material.dart';
import 'package:graduate_thesis/routes/route_names.dart';
import '../screens/generate_password/generate_password_homepage.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/onboarding/splash_screen.dart';
import '../screens/onboarding/wellcome_screen.dart';
import '../screens/sign_in_screen/sign_in_screen.dart';
import '../screens/sign_up_screen/sign_up_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings path) {
    String routePath = path.name ?? '';
    Widget _screenFor(String route) {
      if (route == wellcomeRoute) {
        return WellcomeScreen();
      }
      if (route == splashRoute) {
        return SplashScreen();
      }
      if (route == homeRoute) {
        return HomeScreen();
      }
      if (route == generatePasswordRoute) {
        return GeneratePasswordScreen();
      }
      if (route == signInRoute) {
        return SignInScreen();
      }
      if (route == signUpRoute) {
        return SignUpScreen();
      }
      return Container();
    }

    return MaterialPageRoute(builder: (_) => _screenFor(routePath));
  }
}
