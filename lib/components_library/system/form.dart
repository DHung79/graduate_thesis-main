import 'package:flutter/material.dart';
import 'package:graduate_thesis/style_guide/style_guide.dart';

class AppForm extends StatefulWidget {
  final String iconName;
  final Color colorIcon;
  final Color focusedTextColor;
  final int buttonStyle;
  const AppForm({Key? key}) : super(key: key);
  @override
  State<AppForm> createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: ColorGuide().text2,fontFamily: 'PlusJakartaSans',fontWeight: FontWeight.w700),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorGuide().shade6, width: 2)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorGuide().primary1, width: 2)),
          prefixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: icon(IconName().user, ColorGuide().primary1, 24),
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter something";
        }
        return null;
      },
    );
  }
}
