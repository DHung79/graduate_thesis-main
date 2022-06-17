import 'package:flutter/material.dart';

class AppButton {
  static Widget roundedButton({
    required Widget child,
    void Function()? onPressed,
    Color? color,
    Color lineColor = Colors.white,
    Color highlightColor = Colors.transparent,
    double lineWidth = 1,
    BoxConstraints constraints = const BoxConstraints(minHeight: 44),
    BorderRadiusGeometry borderRadius =
        const BorderRadius.all(Radius.circular(4)),
  }) {
    return Container(
      constraints: constraints,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          primary: highlightColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  static Widget outlineRounded({
    required Widget child,
    void Function()? onPressed,
    Color? color,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    Color outlineColor = Colors.white,
    double borderWidth = 1,
    BoxConstraints? constraints,
  }) {
    return Container(
      constraints: constraints,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: outlineColor,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(
              width: borderWidth,
              color: outlineColor,
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
