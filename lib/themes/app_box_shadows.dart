import 'package:flutter/material.dart';
import 'package:graduate_thesis/themes/app_colors.dart';

class AppBoxShadow {
  static BoxShadow light1 = shadow(16, 0.16);
  static BoxShadow light2 = shadow(16, 0.24);
  static BoxShadow harsh = shadow(8, 0.32);
}

BoxShadow shadow(double blurRadius, double opacity) {
  return BoxShadow(
    color: AppColor.shadow.withOpacity(opacity),
    blurRadius: blurRadius,
    blurStyle: BlurStyle.normal,
  );
}
