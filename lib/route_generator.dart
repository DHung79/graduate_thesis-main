import 'package:flutter/material.dart';
import 'package:graduate_thesis/screen/Homepage/home_page.dart';
import 'package:graduate_thesis/screen/generate_password/generate_password_homepage.dart';
import 'package:graduate_thesis/screen/login_register/sign_in.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/generatePasswordHomePage':
        return MaterialPageRoute(builder: (_) => Generate_Password_HomePage());
        case '/signIn': 
        return MaterialPageRoute(builder: (_) => SignIn());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(child: Text('ERROR!')),
      );
    });
  }
}
