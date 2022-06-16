import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/themes/jt_indicator.dart';
import '/core/models/account_model.dart';
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
  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: AppColor.shade4,
      body: StreamBuilder(
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(userData),
                    _buildCategory(userData),
                  ],
                ),
              );
            } else {
              return const JTIndicator();
            }
          }),
    );
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
                    onChanged: (value) {},
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
