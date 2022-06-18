import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduate_thesis/widgets/jt_toast.dart';
import '../../../core/models/account_model.dart';
import '../../../themes/theme.dart';

class SocialMediaDialog extends StatefulWidget {
  final List<AccountModel> accounts;
  final Widget header;
  const SocialMediaDialog({
    Key? key,
    required this.accounts,
    required this.header,
  }) : super(key: key);

  @override
  State<SocialMediaDialog> createState() => _SocialMediaDialogState();
}

class _SocialMediaDialogState extends State<SocialMediaDialog> {
  @override
  Widget build(BuildContext context) {
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
                      widget.header,
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
                SizedBox(
                  width: dialogWidth - 48,
                  height: widget.accounts.length > 1 ? 272 : 120,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const ClampingScrollPhysics(),
                    itemCount: widget.accounts.length,
                    itemBuilder: (context, index) {
                      final account = widget.accounts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildAccount(account),
                      );
                    },
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

  Widget _buildAccount(AccountModel account) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: AppColor.text4,
            width: 3,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            Row(
              children: [
                AppIcon(
                  getIcon(account.type),
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    account.name,
                    style: AppTextStyle.mediumBodyText(AppColor.text1),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCopyField(
                    title: account.email,
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: account.email),
                      );
                      JTToast.successToast(context, message: '');
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
                        JTToast.successToast(context, message: '');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
