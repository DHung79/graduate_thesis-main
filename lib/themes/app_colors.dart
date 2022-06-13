import 'package:flutter/material.dart';

class AppColor {
  static Color primary1 = hexToColor('#5068F2');
  static Color primary2 = hexToColor('#485DD9');
  static Color primary3 = hexToColor('#F2E205');
  static Color primary4 = hexToColor('#F27405');
  static Color primary5 = hexToColor('#F20505');
  static Color text1 = hexToColor('#222831');
  static Color text2 = hexToColor('#393E46');
  static Color text3 = hexToColor('#FFFFFF');
  static Color text4 = hexToColor('#D9D9D9');
  static Color text5 = hexToColor('#A6A6A6');
  static Color shadow = hexToColor('#4F758C');
  static Color shade1 = hexToColor('#F3F4F4');
  static Color shade2 = hexToColor('#F9F9F9');
  static Color shade3 = hexToColor('#EEEEEE');
  static Color shade4 = hexToColor('#F2F2F2');
  static Color shade5 = hexToColor('#D9D9D9');
  static Color shade6 = hexToColor('#A6A6A6');
  static Color shade7 = hexToColor('#737373');
  static Color shade8 = hexToColor('#0D0D0D');
  static Color shade9 = hexToColor('#E9F0FF');
  static Color inactive1 = hexToColor('#E1E5E7');
  static Color inactive2 = hexToColor('#F5F6F6');
  static Color successful1 = hexToColor('#53A62D');
  static Color successful2 = hexToColor('#9CD918');
  static Color successful3 = hexToColor('#B6D96A');
  static Color failed = hexToColor('#F6416C');
  static Color warning = hexToColor('#FFDE7D');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
