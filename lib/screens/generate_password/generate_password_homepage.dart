import 'package:flutter/material.dart';
import 'package:graduate_thesis/style_guide/style_guide.dart';

class GeneratePasswordScreen extends StatelessWidget {
  const GeneratePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: input(
              'This is page 2', FontWeight.w700, ColorGuide().primary1, 100)),
    );
  }
}
