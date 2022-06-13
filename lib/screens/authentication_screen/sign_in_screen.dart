import 'package:flutter/material.dart';
import 'package:graduate_thesis/style_guide/style_guide.dart';
import 'package:graduate_thesis/themes/theme.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "PM",
                style: TextStyle(
                  fontFamily: 'Mogena',
                  fontSize: 128,
                  color: AppColor.primary1,
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Form(
                  child: Column(
                children: [
                  AppTextField.textField(),
                  SizedBox(
                    height: 24,
                  ),
                  AppTextField.textField(),
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
