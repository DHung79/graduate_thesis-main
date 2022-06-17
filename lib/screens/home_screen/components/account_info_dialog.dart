import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/models/account_model.dart';
import '../../../themes/theme.dart';

class AccountInfoDialog extends StatefulWidget {
  final AccountModel account;
  final String title;
  const AccountInfoDialog({
    Key? key,
    required this.account,
    required this.title,
  }) : super(key: key);

  @override
  State<AccountInfoDialog> createState() => _AccountInfoDialogState();
}

class _AccountInfoDialogState extends State<AccountInfoDialog> {
  @override
  Widget build(BuildContext context) {
    final account = widget.account;
    return LayoutBuilder(builder: (context, size) {
      const double dialogWidth = 334;
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        content: Container(
          constraints: const BoxConstraints(
            minWidth: dialogWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Account Information',
                          style: AppTextStyle.mediumHeaderTitle(AppColor.text1),
                        ),
                      ),
                      InkWell(
                          splashColor: AppColor.transparent,
                          highlightColor: AppColor.transparent,
                          child: AppIcon(
                            AppIcons.close,
                            size: 24,
                            color: AppColor.text1,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    thickness: 1,
                    color: AppColor.shade4,
                  ),
                ),
                Row(
                  children: [
                    AppIcon(
                      getIcon(account.type),
                      size: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        widget.title,
                        style: AppTextStyle.mediumBodyText(AppColor.text1),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCopyField(
                        title: account.email,
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(text: account.email),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: _buildCopyField(
                          title: account.password.replaceAll(RegExp(r"."), "*"),
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(text: account.password),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: AppButton.roundedButton(
                    color: AppColor.primary1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcon(
                          AppIcons.back2,
                          color: AppColor.white,
                          size: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Back',
                            style: AppTextStyle.headerTitle(
                              AppColor.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildCopyField({
    required String title,
    required Function()? onTap,
  }) {
    return InkWell(
      splashColor: AppColor.transparent,
      highlightColor: AppColor.transparent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.normalText(AppColor.text1),
          ),
          AppIcon(
            AppIcons.copy,
            color: AppColor.primary4,
          ),
        ],
      ),
    );
  }
}
