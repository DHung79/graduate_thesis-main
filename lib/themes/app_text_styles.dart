import 'dart:ui';
import 'package:flutter/material.dart';

class AppTextStyle {
  // fontFamily: 'Mogena
  static TextStyle mediumBigText(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 24,
    );
  }

  static TextStyle bigText(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 24,
    );
  }

  static TextStyle headerTitle(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 16,
    );
  }

  static TextStyle mediumHeaderTitle(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 16,
    );
  }

  static TextStyle normalHeaderTitle(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 16,
    );
  }

  static TextStyle boldBodyText(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 14,
    );
  }

  static TextStyle mediumBodyText(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 14,
    );
  }

  static TextStyle normalText(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
    );
  }

  static TextStyle link(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle superscript(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
      fontFeatures: const [
        FontFeature.enable('sups'),
      ],
    );
  }

  static TextStyle subText(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 12,
    );
  }

  static TextStyle superSmallText(Color color) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 10,
    );
  }
}
