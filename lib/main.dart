import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/routes/route_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/route_names.dart';
export 'routes/route_names.dart';
export './screens/layout_template/page_template.dart';
export './core/logger/logger.dart';

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
