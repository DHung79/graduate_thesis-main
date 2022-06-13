import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graduate_thesis/components_library/system/buttons.dart';

import '../../style_guide/style_guide.dart';

class RecentAccountFeature extends StatefulWidget {
  const RecentAccountFeature({Key? key}) : super(key: key);

  @override
  State<RecentAccountFeature> createState() => _RecentAccountFeatureState();
}

class _RecentAccountFeatureState extends State<RecentAccountFeature> {
  double cloneScreenWidth = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    cloneScreenWidth = screenWidth;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: screenWidth,
      decoration: BoxDecoration(
          color: ColorGuide().text3,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [Shadow().light1]),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          input("Recent", FontWeight.w700, ColorGuide().primary1, 16),
          SizedBox(
            height: 16,
          ),
          recentAccountItem(StickerName().facebook, "Facebook",
              "vinhkygm@gmail.com", "**********"),
          SizedBox(
            height: 16,
          ),
          recentAccountItem(StickerName().google, "Google",
              "vinhkygm@gmail.com", "**********"),
          SizedBox(
            height: 16,
          ),
          recentAccountItem(StickerName().google, "Google",
              "vinhkygm@gmail.com", "**********"),
          SizedBox(
            height: 16,
          ),
          recentAccountItem(StickerName().google, "Google",
              "vinhkygm@gmail.com", "**********"),
          SizedBox(
            height: 16,
          ),
          recentAccountItem(StickerName().google, "Google",
              "vinhkygm@gmail.com", "**********"),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
              child: Container(
                  height: 44,
                  alignment: Alignment.centerLeft,
                  child: input(
                      "Show more", FontWeight.w700, ColorGuide().text1, 14)),
              onTap: () {})
        ],
      ),
    );
  }

  Widget recentAccountItem(
      String logoName, String title, String username, String password) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(
        child: TextButton(
          onPressed: () {
            setState(() {
              showAccountInformation(context, cloneScreenWidth);
            });
          },
          child: Row(
            children: [
              sticker(logoName, 32),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ColorGuide().text1,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    input(username, FontWeight.normal, ColorGuide().text1, 14),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      password,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: ColorGuide().text1,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: 16,
      ),
      GestureDetector(
          onTap: () {},
          child: Container(
            width: 24,
            height: 24,
            child: Icon(
              Icons.remove_red_eye,
              size: 24,
              color: ColorGuide().text5,
            ),
          ))
    ]);
  }

  void showAccountInformation(BuildContext context, double screenWidth) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Wrap(
              children: [
                Container(
                  width: screenWidth,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorGuide().text3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: input("Account Information", FontWeight.w700,
                                ColorGuide().text1, 16),
                          ),
                          GestureDetector(
                              child: Container(
                                  width: 40,
                                  height: 24,
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.close,
                                    size: 24,
                                    color: ColorGuide().text1,
                                  )),
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        thickness: 1,
                        color: ColorGuide().shade4,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            child: sticker(StickerName().facebook, 32),
                          ),
                          SizedBox(width: 16),
                          input("Facebook", FontWeight.w700, ColorGuide().text1, 16)
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: input("vinhkygm@gmail.com", FontWeight.w500,
                                      ColorGuide().text1, 14)),
                              SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                  child: Container(
                                      width: 40,
                                      height: 24,
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        child: icon(IconName().copy,
                                            ColorGuide().primary4, 24),
                                      )),
                                  onTap: () {
                                    setState(() {
                                      log('hello??');
                                    });
                                  })
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: input("**************", FontWeight.w500,
                                    ColorGuide().text1, 14),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                  child: Container(
                                      width: 40,
                                      height: 24,
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        child: icon(IconName().copy,
                                            ColorGuide().primary4, 24),
                                      )),
                                  onTap: () {
                                    setState(() {
                                      log('hello??');
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      AppIconButton(
                          text: 'Back',
                          fontWeight: FontWeight.w500,
                          textColor: ColorGuide().text3,
                          buttonColor: ColorGuide().primary1,
                          fontSize: 14,
                          iconName: IconName().back,
                          iconColor: ColorGuide().text3,
                          iconSize: 24,
                          isIconLeft: true,
                          function: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          })
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
