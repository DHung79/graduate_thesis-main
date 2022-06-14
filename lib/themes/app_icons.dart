import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconData {
  String path;
  AppIconData({required this.path});
}

class AppIcons {
  static AppIconData home = AppIconData(
    path: "assets/icons/fi-rr-home.svg",
  );
  static AppIconData settings = AppIconData(
    path: "assets/icons/setting-1881213.svg",
  );
  static AppIconData add = AppIconData(
    path: "assets/icons/circle-add.svg",
  );
  static AppIconData copy = AppIconData(
    path: "assets/icons/documents.svg",
  );
  static AppIconData search = AppIconData(
    path: "assets/icons/search-1.svg",
  );
  static AppIconData random = AppIconData(
    path: "assets/icons/random-(1).svg",
  );
  static AppIconData back = AppIconData(
    path: "assets/icons/keyboard_backspace.svg",
  );
  static AppIconData user = AppIconData(
    path: "assets/icons/account_circle_full.svg",
  );
  static AppIconData lock = AppIconData(
    path: "assets/icons/lock.svg",
  );
  static AppIconData email = AppIconData(
    path: "assets/icons/alternate_email.svg",
  );
  static AppIconData backIOS = AppIconData(
    path: "assets/icons/arrow_back_ios.svg",
  );
  static AppIconData back2 = AppIconData(
    path: "assets/icons/arrow_back.svg",
  );
  static AppIconData forward = AppIconData(
    path: "assets/icons/arrow_forward.svg",
  );
  static AppIconData checkRec = AppIconData(
    path: "assets/icons/check_box_black_24dp 1.svg",
  );
  static AppIconData checkRec2 = AppIconData(
    path: "assets/icons/check_box_outline_blank_black_24dp 1.svg",
  );
  static AppIconData checkCir = AppIconData(
    path: "assets/icons/circle-check.svg",
  );
  static AppIconData checkCir2 = AppIconData(
    path: "assets/icons/circle-check-fill.svg",
  );
  static AppIconData close = AppIconData(
    path: "assets/icons/close.svg",
  );
  static AppIconData expanded = AppIconData(
    path: "assets/icons/expand_more.svg",
  );
  static AppIconData eyeOff = AppIconData(
    path: "assets/icons/Eye_off.svg",
  );
  static AppIconData eye = AppIconData(
    path: "assets/icons/Eye.svg",
  );
  static AppIconData google = AppIconData(
    path: "assets/icons/google.svg",
  );
  static AppIconData youtube = AppIconData(
    path: "assets/icons/youtube.svg",
  );
  static AppIconData spotify = AppIconData(
    path: "assets/icons/spotify.svg",
  );
  static AppIconData facebook = AppIconData(
    path: "assets/icons/facebook.svg",
  );
  static AppIconData instagram = AppIconData(
    path: "assets/icons/instagram.svg",
  );
  static AppIconData socialMedia = AppIconData(
    path: "assets/icons/social-media.svg",
  );
  static AppIconData games = AppIconData(
    path: "assets/icons/controller.svg",
  );
  static AppIconData works = AppIconData(
    path: "assets/icons/suitcase.svg",
  );
  static AppIconData others = AppIconData(
    path: "assets/icons/other.svg",
  );
  static AppIconData lockSticker = AppIconData(
    path: "assets/icons/padlock.svg",
  );
  static AppIconData wallet = AppIconData(
    path: "assets/icons/purse.svg",
  );
  static AppIconData blankSearch = AppIconData(
    path: "assets/icons/search.svg",
  );
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    Key? key,
    this.size = 24,
    this.color,
    this.semanticLabel,
  }) : super(key: key);

  final AppIconData? icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon!.path,
      width: size,
      height: size,
      color: color,
      semanticsLabel: semanticLabel,
    );
  }
}
