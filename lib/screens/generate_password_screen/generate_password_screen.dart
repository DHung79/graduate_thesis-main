import 'package:flutter/material.dart';
import '../../themes/theme.dart';
import '../../main.dart';

class GeneratePasswordScreen extends StatelessWidget {
  const GeneratePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Center(
        child: Text(
          'This is page 2',
          style: AppTextStyle.bigText(AppColor.primary1),
        ),
      ),
    );
  }
}
