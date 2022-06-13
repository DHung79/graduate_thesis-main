import 'package:flutter/material.dart';
import 'package:graduate_thesis/themes/theme.dart';

class AppTextField {
  static Widget textField({
    Function(String)? onChanged,
    String? Function(String?)? validator,
    Function(String?)? onSaved,
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
              AppIcons.user,
              color: AppColor.primary1,
            ),
          )),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
