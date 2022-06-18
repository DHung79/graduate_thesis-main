import 'package:flutter/material.dart';
import '/main.dart';
import '/themes/theme.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  void initState() {
    prefs.then((value) {
      currentUserId = value.getString('currentUserId') ?? '';
      if (currentUserId.isNotEmpty) {
        navigatorTo(context, homeRoute);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: screenSize.height,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.wellcome),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 44),
                        child: InkWell(
                          splashColor: AppColor.transparent,
                          highlightColor: AppColor.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Skip',
                              style:
                                  AppTextStyle.mediumBodyText(AppColor.shade6),
                            ),
                          ),
                          onTap: () {
                            navigatorTo(context, splashRoute);
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 12,
                            width: 45,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  color: AppColor.text4,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 27, 0, 178),
                        child: Column(
                          children: [
                            Text(
                              'Welcome to',
                              style: AppTextStyle.normalHeaderTitle(
                                  AppColor.shade3),
                            ),
                            Text(
                              'Password Manager',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'PlusJakartaSans',
                                color: AppColor.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
