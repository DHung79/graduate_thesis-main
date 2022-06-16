import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduate_thesis/routes/route_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/route_names.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
String currentUserId = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PlusJakartaSans'),
      initialRoute: wellcomeRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}

navigatorTo(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}
