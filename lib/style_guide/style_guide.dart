import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Color
class ColorGuide {
  Color primary1 = Color(0xff5068F2);
  Color primary2 = Color(0xff485DD9);
  Color primary3 = Color(0xffF2E205);
  Color primary4 = Color(0xffF27405);
  Color primary5 = Color(0xffF20505);
  Color text1 = Color(0xff222831);
  Color text2 = Color(0xff393E46);
  Color text3 = Color(0xffFFFFFF);
  Color text4 = Color(0xffD9D9D9);
  Color text5 = Color(0xffA6A6A6);
  Color shadow = Color(0xff4F758C);
  Color shade1 = Color(0xffF3F4F4);
  Color shade2 = Color(0xffF9F9F9);
  Color shade3 = Color(0xffEEEEEE);
  Color shade4 = Color(0xffF2F2F2);
  Color shade5 = Color(0xffD9D9D9);
  Color shade6 = Color(0xffA6A6A6);
  Color shade7 = Color(0xff737373);
  Color shade8 = Color(0xff0D0D0D);
  Color shade9 = Color(0xffE9F0FF);
  Color inactive1 = Color(0xffE1E5E7);
  Color inactive2 = Color(0xffF5F6F6);
  Color successful1 = Color(0xff53A62D);
  Color successful2 = Color(0xff9CD918);
  Color successful3 = Color(0xffB6D96A);
  Color failed = Color(0xffF6416C);
  Color warning = Color(0xffFFDE7D);
}

//Sticker Store
class StickerName {
  String google = "assets/icons/google.svg";
  String youtube = "assets/icons/youtube.svg";
  String spotify = "assets/icons/spotify.svg";
  String facebook = "assets/icons/facebook.svg";
  String instagram = "assets/icons/instagram.svg";
  String socialMedia = "assets/icons/social-media.svg";
  String games = "assets/icons/controller.svg";
  String works = "assets/icons/suitcase.svg";
  String others = "assets/icons/other.svg";
  String lock = "assets/icons/padlock.svg";
  String wallet = "assets/icons/purse.svg";
  String blankSearch = "assets/icons/search.svg";
}

//Icon Store
class IconName {
  String home = "assets/icons/fi-rr-home.svg";
  String settings = "assets/icons/setting-1881213.svg";
  String add = "assets/icons/circle-add.svg";
  String copy = "assets/icons/documents.svg";
  String search = "assets/icons/search-1.svg";
  String random = "assets/icons/random-(1).svg";
  String back = "assets/icons/keyboard_backspace.svg";
  String user = 'assets/icons/account_circle_full.svg';
  String email = 'assets/icons/alternate_email.svg';
  String backIOS = 'assets/icons/arrow_back_ios.svg';
  String back2 = "assets/icons/arrow_back.svg";
  String forward = "assets/icons/arrow_forward.svg";
  String checkRec = "assets/icons/check_box_black_24dp 1.svg";
  String checkRec2 = "assets/icons/check_box_outline_blank_black_24dp 1.svg";
  String checkCir = "assets/icons/circle-check.svg";
  String checkCir2 = "assets/icons/circle-check-fill.svg";
  String close = "assets/icons/close.svg";
  String expanded = "assets/icons/expand_more.svg";
  String eyeOff = "assets/icons/Eye_off.svg";
  String eye = "assets/icons/Eye.svg";
}

//Call Icon
Widget icon(String string, Color? color, double size) {
  return SvgPicture.asset(
    string,
    color: color,
    width: size,
    height: size,
  );
}

Widget sticker(String string, double size) {
  return SvgPicture.asset(
    string,
    width: size,
    height: size,
  );
}

//Typography

Text input(String string, FontWeight fontWeight, Color color, double fontSize) {
  return Text(
    string,
    style: TextStyle(fontWeight: fontWeight, color: color, fontSize: fontSize),
  );
}

//ShadowSetting

class Shadow {
  BoxShadow light1 = shadow(16, 0.16);
  BoxShadow light2 = shadow(16, 0.24);
  BoxShadow harsh = shadow(8, 0.32);
}

BoxShadow shadow(double blurRadius, double opacity) {
  return BoxShadow(
      color: ColorGuide().shadow.withOpacity(opacity),
      blurRadius: blurRadius,
      blurStyle: BlurStyle.normal);
}
