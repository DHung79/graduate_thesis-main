import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduate_thesis/themes/theme.dart';

class AppTextField {
  static Widget textField({
    TextEditingController? controller,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    Function(String?)? onSaved,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    String? hintText,
    Function(String)? onFieldSubmitted,
    AppIconData? icon,
  }) {
    return TextFormField(
      style: AppTextStyle.boldBodyText(AppColor.text2),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.shade6,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primary1,
            width: 2,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppIcon(
            icon,
            color: AppColor.primary1,
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.mediumBodyText(AppColor.shade6),
      ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }

  static Widget passwordField({
    TextEditingController? controller,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    Function(String?)? onSaved,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    required bool obscureText,
    required Function() passwordIconOnPressed,
    String? hintText,
    Function(String)? onFieldSubmitted,
  }) {
    return TextFormField(
      style: AppTextStyle.boldBodyText(AppColor.text2),
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.shade6,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primary1,
            width: 2,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppIcon(
            AppIcons.lock,
            color: AppColor.primary1,
          ),
        ),
        suffixIcon: TextButton(
          onPressed: passwordIconOnPressed,
          child: obscureText
              ? AppIcon(
                  AppIcons.eyeOff,
                  color: AppColor.shade6,
                )
              : AppIcon(
                  AppIcons.eye,
                  color: AppColor.shade6,
                ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.mediumBodyText(AppColor.shade6),
      ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
