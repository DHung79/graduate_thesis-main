import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/screens/home_screen/components/account_info_dialog.dart';
import '../../core/models/account_model.dart';
import '../../widgets/jt_indicator.dart';
import '/core/models/user_model.dart';
import '/main.dart';
import '/themes/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double statusBarHeight = 0;
  final collection = FirebaseFirestore.instance.collection('users');
  final _searchController = TextEditingController();
  bool showAll = false;
  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom;
    return PageTemplate(
      child: StreamBuilder(
          stream: collection.doc(currentUserId).snapshots(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              final userData = UserModel.fromJson(data.data()!);
              // final newAccount = AccountModel(
              //   type: 'facebook',
              //   email: 'facebook@gmail.com',
              //   password: '123456',
              // );
              // bool hasAccount = userData.accounts
              //     .where((e) =>
              //         e.type == newAccount.type && e.email == newAccount.email)
              //     .isNotEmpty;
              // if (!hasAccount) {
              //   userData.accounts.add(newAccount);
              // }
              // data.reference.update(userData.toJson());
              return Column(
                children: [
                  _buildHeader(userData),
                  Expanded(
                    child: Stack(
                      children: [
                        _buildContent(userData),
                        if (keyboardVisible == 0) _addButton(userData),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const JTIndicator();
            }
          }),
    );
  }

  Widget _addButton(UserModel user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 39),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.primary1,
                ),
                constraints: const BoxConstraints(
                  maxWidth: 136,
                  minHeight: 44,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Add New',
                        style: AppTextStyle.headerTitle(
                          AppColor.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(4),
                        ),
                        color: AppColor.primary2,
                      ),
                      child: Center(
                        child: AppIcon(
                          AppIcons.add,
                          color: AppColor.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContent(UserModel user) {
    if (_searchController.text.isEmpty) {
      return SingleChildScrollView(
        child: Column(
          children: [
            _buildCategory(user),
            _buildRecent(user),
            _buildSocialMedia(user),
          ],
        ),
      );
    } else {
      final searchResults = user.accounts
          .where((e) => e.email.contains(_searchController.text))
          .toList();
      if (searchResults.isNotEmpty) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 19, 0, 14),
                child: Text(
                  'Found ${searchResults.length} accounts',
                  style: AppTextStyle.mediumBodyText(AppColor.primary1),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final account = searchResults[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _recentAccountItem(account),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,47,0,23),
                child: Image.asset(
                  AppImages.search,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Sorry, we can’t found it.',
                style: AppTextStyle.normalText(AppColor.text5),
              ),
            ],
          ),
        );
      }
    }
  }

  Widget _buildHeader(UserModel user) {
    return SizedBox(
      height: 145 + statusBarHeight,
      child: Stack(
        children: [
          Container(
            height: 129 + statusBarHeight,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'PM',
                      style: TextStyle(
                        color: AppColor.primary1,
                        fontSize: 40,
                        fontFamily: 'Mogena',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: AppButton.outlineRounded(
                      outlineColor: AppColor.primary4,
                      borderRadius: BorderRadius.circular(15),
                      child: Row(
                        children: [
                          Text(
                            'Your vault',
                            style: AppTextStyle.headerTitle(AppColor.primary4),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: AppIcon(AppIcons.wallet),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 44),
                  decoration: BoxDecoration(
                    boxShadow: [AppBoxShadow.light1],
                    color: AppColor.text3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: AppTextField.prefixIconField(
                    controller: _searchController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: AppIcon(
                        AppIcons.search,
                        color: AppColor.primary4,
                      ),
                    ),
                    hintText: 'Type account name...',
                    onChanged: (value) {
                      setState(() {
                        _searchController.text = value;
                        _searchController.selection =
                            TextSelection.collapsed(offset: value.length);
                      });
                    },
                    onSaved: (value) {},
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCategory(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 18),
            child: Text(
              'Category',
              style: AppTextStyle.headerTitle(AppColor.primary1),
            ),
          ),
          Wrap(
            spacing: 41,
            runSpacing: 18,
            children: [
              _categoryItem(
                name: 'Social Media',
                icon: AppIcons.socialMedia,
                onTap: () {},
              ),
              _categoryItem(
                name: 'Entertainments',
                icon: AppIcons.games,
                onTap: () {},
              ),
              _categoryItem(
                name: 'Work',
                icon: AppIcons.works,
                onTap: () {},
              ),
              _categoryItem(
                name: 'Others',
                icon: AppIcons.others,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecent(UserModel user) {
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
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Recent',
                  style: AppTextStyle.headerTitle(AppColor.primary1),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: showAll ? user.accounts.length : 2,
                itemBuilder: (context, index) {
                  final account = user.accounts[index];
                  return _recentAccountItem(account);
                },
              ),
              if (!showAll && user.accounts.length > 2)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: InkWell(
                    splashColor: AppColor.transparent,
                    highlightColor: AppColor.transparent,
                    child: Container(
                      height: 44,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Show more',
                        style: AppTextStyle.boldBodyText(AppColor.text2),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        showAll = true;
                      });
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _buildSocialMedia(UserModel user) {
    final screenSize = MediaQuery.of(context).size;
    final socialMedias = [
      'Facebook',
      'Youtube',
      'Google',
      'Instagram',
      'Spotify',
    ];
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
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 24, 0),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 80),
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
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentAccountItem(AccountModel account) {
    bool passwordSecure = true;
    return LayoutBuilder(builder: (context, size) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        final title = account.type[0].toUpperCase() + account.type.substring(1);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return AccountInfoDialog(
                        account: account,
                        title: title,
                      );
                    });
              },
              child: Row(
                children: [
                  AppIcon(
                    getIcon(account.type),
                    size: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle.mediumBodyText(AppColor.primary1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            account.email,
                            style: AppTextStyle.normalText(AppColor.text1),
                          ),
                        ),
                        Container(
                          width: size.maxWidth - 110,
                          constraints: const BoxConstraints(minHeight: 14),
                          child: AppTextField.passwordReadOnly(
                            initialValue: account.password,
                            obscureText: passwordSecure,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: AppColor.transparent,
              highlightColor: AppColor.transparent,
              onTap: () {
                setState(() {
                  passwordSecure = !passwordSecure;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppIcon(
                  AppIcons.eye,
                  size: 24,
                  color: AppColor.text5,
                ),
              ),
            )
          ],
        );
      });
    });
  }

  Widget _categoryItem({
    required String name,
    required AppIconData icon,
    required Function() onTap,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 100,
        maxHeight: 122,
      ),
      child: InkWell(
        splashColor: AppColor.transparent,
        highlightColor: AppColor.transparent,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.text3,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [AppBoxShadow.light1],
                ),
                child: AppIcon(
                  icon,
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  name,
                  style: AppTextStyle.mediumBodyText(AppColor.text1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
