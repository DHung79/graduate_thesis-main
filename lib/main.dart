import 'package:flutter/material.dart';
import 'package:graduate_thesis/Screen/Homepage/home_page.dart';
import 'package:graduate_thesis/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
      ),
      initialRoute: "/signIn",
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
