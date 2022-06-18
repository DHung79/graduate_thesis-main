import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../themes/theme.dart';

class JTToast {
  static void init(BuildContext context) {
    FToast().init(context);
  }

  static void successToast(
    BuildContext context, {
    required String message,
    double height = 92,
  }) {
    final screenSize = MediaQuery.of(context).size;
    FToast().showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
      // positionedToastBuilder: (context, child) {
      //   return Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 125),
      //         child: child,
      //       ),
      //     ],
      //   );
      // },
      child: Container(
        width: screenSize.width - 32,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColor.white,
          boxShadow: [AppBoxShadow.light1],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 12,
                height: height,
                decoration: BoxDecoration(
                  color: AppColor.primary1,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đã sao chép tài khoản',
                  style: AppTextStyle.headerTitle(AppColor.primary1),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Hãy truy cập ứng dụng tương ứng để dán dữ liệu',
                    style: AppTextStyle.mediumBodyText(AppColor.text1),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: height - 32,
                width: 1,
                color: AppColor.shade3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
              child: AppIcon(
                AppIcons.close,
                color: AppColor.text1,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void warningToast({
    required Widget child,
  }) {
    FToast().showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
      child: LayoutBuilder(builder: (context, size) {
        return Container(
          width: size.maxWidth - 32,
          constraints: const BoxConstraints(minHeight: 92),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.shadow.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 12,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10),
                  ),
                  color: AppColor.warning,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: child),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: VerticalDivider(
                            thickness: 1.5,
                            color: AppColor.shade1,
                          ),
                        ),
                        AppButton.roundedButton(
                          color: AppColor.white,
                          highlightColor: AppColor.white,
                          constraints: const BoxConstraints(
                            minHeight: 40,
                            minWidth: 40,
                          ),
                          child: AppIcon(
                            AppIcons.close,
                            color: AppColor.black,
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
