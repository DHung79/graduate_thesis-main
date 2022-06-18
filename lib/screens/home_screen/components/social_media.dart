import 'package:flutter/material.dart';
import '../../../core/models/user_model.dart';
import '../../../themes/theme.dart';
import 'social_media_dialog.dart';

class SocialMedia extends StatefulWidget {
  final UserModel user;
  const SocialMedia({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  final socialMedias = [
    'Facebook',
    'Youtube',
    'Google',
    'Instagram',
    'Spotify',
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.text3,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [AppBoxShadow.light1],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Social Media',
                  style: AppTextStyle.headerTitle(AppColor.primary1),
                ),
              ),
              SizedBox(
                height: 96,
                width: screenSize.width - 64,
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final socialMedia = socialMedias[index];
                      return _buildItem(socialMedia);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String socialMedia) {
    final accounts = widget.user.accounts
        .where(((e) => e.type.toLowerCase() == socialMedia.toLowerCase()))
        .toList();
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: InkWell(
        child: Container(
          constraints: const BoxConstraints(minWidth: 80),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                AppIcon(
                  getIcon(socialMedia),
                  size: 48,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    socialMedia,
                    style: AppTextStyle.mediumBodyText(
                      AppColor.text1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return SocialMediaDialog(
                  accounts: accounts,
                  header: Row(
                    children: [
                      AppIcon(
                        getIcon(socialMedia),
                        size: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          socialMedia,
                          style: AppTextStyle.mediumHeaderTitle(
                            AppColor.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
