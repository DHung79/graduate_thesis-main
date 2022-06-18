import 'package:flutter/material.dart';
import '/routes/route_names.dart';
import '../screens/generate_password/generate_password_homepage.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/not_found/page_not_found_screen.dart';
import '../screens/onboarding/splash_screen.dart';
import '../screens/onboarding/wellcome_screen.dart';
import '../screens/sign_in_screen/sign_in_screen.dart';
import '../screens/sign_up_screen/sign_up_screen.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings path) {
    String routePath = path.name ?? '';
    Widget _screenFor(String route) {
      if (route == wellcomeRoute) {
        return const WellcomeScreen();
      }
      if (route == splashRoute) {
        return const SplashScreen();
      }
      if (route == homeRoute) {
        return const HomeScreen();
      }
      if (route == generatePasswordRoute) {
        return const GeneratePasswordScreen();
      }
      if (route == signInRoute) {
        return const SignInScreen();
      }
      if (route == signUpRoute) {
        return const SignUpScreen();
      }
      return PageNotFoundScreen(route);
    }

    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => _screenFor(routePath),
      settings: path,
      transitionDuration: const Duration(seconds: 0),
    );
  }
}
