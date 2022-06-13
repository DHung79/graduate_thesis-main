import 'package:flutter/material.dart';
import 'package:graduate_thesis/style_guide/style_guide.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final FontWeight fontWeight;
  final Color textColor;
  final Color buttonColor;
  final double fontSize;
  final VoidCallback function;
  const DefaultButton(
      {Key? key,
      required this.text,
      required this.fontWeight,
      required this.textColor,
      required this.buttonColor,
      required this.fontSize,
      required this.function})
      : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return defaultButton(widget.text, widget.fontWeight, widget.textColor,
        widget.fontSize, screenWidth, widget.buttonColor, widget.function);
  }
}

Widget defaultButton(
    String text,
    FontWeight fontWeight,
    Color textColor,
    double fontSize,
    double screenWidth,
    Color buttonColor,
    VoidCallback function) {
  return GestureDetector(
      onTap: function,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: buttonColor),
        width: screenWidth,
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: input(text, fontWeight, textColor, fontSize)),
      ));
}

class AppIconButton extends StatefulWidget {
  final String text;
  final FontWeight fontWeight;
  final Color textColor;
  final Color buttonColor;
  final double fontSize;
  final String iconName;
  final Color iconColor;
  final double iconSize;
  final bool isIconLeft;
  final VoidCallback function;
  const AppIconButton(
      {Key? key,
      required this.text,
      required this.fontWeight,
      required this.textColor,
      required this.buttonColor,
      required this.fontSize,
      required this.iconName,
      required this.iconColor,
      required this.iconSize,
      required this.isIconLeft,
      required this.function})
      : super(key: key);

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return appIconButton(
        widget.text,
        widget.fontWeight,
        widget.textColor,
        widget.fontSize,
        screenWidth,
        widget.buttonColor,
        widget.iconName,
        widget.iconColor,
        widget.iconSize,
        widget.isIconLeft,
        widget.function);
  }

  Widget appIconButton(
      String text,
      FontWeight fontWeight,
      Color textColor,
      double fontSize,
      double screenWidth,
      Color buttonColor,
      String iconName,
      Color iconColor,
      double iconSize,
      bool isIconLeft,
      VoidCallback function) {
    return GestureDetector(
        onTap: function,
        child: Container(
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: buttonColor),
            width: screenWidth,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: isIconLeft == true
                  ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      icon(iconName, iconColor, iconSize),
                      SizedBox(
                        width: 16,
                      ),
                      input(text, fontWeight, textColor, fontSize),
                    ])
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        input(text, fontWeight, textColor, fontSize),
                        SizedBox(
                          width: 16,
                        ),
                        icon(iconName, iconColor, iconSize),
                      ],
                    ),
            )));
  }
}
