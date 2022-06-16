import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduate_thesis/core/logger/logger.dart';
import 'package:graduate_thesis/core/models/account_model.dart';
import 'package:graduate_thesis/core/models/user_model.dart';
import 'package:graduate_thesis/main.dart';
import 'package:graduate_thesis/themes/app_colors.dart';
import '../../style_guide/style_guide.dart';
import '../../themes/app_icons.dart';

class HeaderHomePage extends StatefulWidget {
  final String? searchText;
  const HeaderHomePage({Key? key, required this.searchText}) : super(key: key);

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  final collection = FirebaseFirestore.instance.collection('users');
  UserModel userData = UserModel.fromJson({});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String? searchText = widget.searchText;
    return StreamBuilder(
        stream: collection.doc(currentUserId).snapshots(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            final userData = UserModel.fromJson(data.data()!);
            final newAccount = AccountModel(
              type: 'facebook',
              email: 'facebook@gmail.com',
              password: '123456',
            );
            bool hasAccount = userData.accounts
                .where((e) =>
                    e.type == newAccount.type && e.email == newAccount.email)
                .isNotEmpty;
            if (!hasAccount) {
              userData.accounts.add(newAccount);
            }

            data.reference.update(userData.toJson());
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorGuide().text3,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    padding: EdgeInsets.all(24),
                    height: 129,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'PM',
                            style: TextStyle(
                                color: ColorGuide().primary1,
                                fontSize: 40,
                                fontFamily: 'Mogena'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: ColorGuide().primary4)),
                            child: Row(children: [
                              input('Your vault', FontWeight.w700,
                                  ColorGuide().primary4, 14),
                              SizedBox(
                                width: 10,
                              ),
                              AppIcon(
                                AppIcons.wallet,
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  )
                ],
              ),
              Positioned(
                top: 107,
                child: Container(
                  width: screenWidth,
                  height: 44,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [Shadow().light1],
                            color: ColorGuide().text3,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Row(children: [
                          AppIcon(
                            AppIcons.search,
                            color: AppColor.primary4,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type account name',
                              hintStyle: TextStyle(
                                  color: ColorGuide().text5, fontSize: 14),
                            ),
                            onSaved: (value) => searchText = value,
                          )),
                        ]),
                      ),
                    ),
                    // child: TextField(controller: searchText,),
                  ),
                ),
              )
            ],
          );
        });
  }
}
