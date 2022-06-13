import 'package:flutter/material.dart';
import 'package:graduate_thesis/routes/route_delegate.dart';

import 'routes/route_names.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PlusJakartaSans'),
      initialRoute: signInRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
