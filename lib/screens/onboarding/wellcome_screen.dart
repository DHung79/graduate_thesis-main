import 'package:flutter/material.dart';
import 'package:graduate_thesis/main.dart';
import 'package:graduate_thesis/routes/route_names.dart';
import 'package:graduate_thesis/themes/theme.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.wellcome),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Skip',
                            style: AppTextStyle.mediumBodyText(AppColor.shade6),
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
                                color: AppColor.text4, shape: BoxShape.circle),
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
                            style:
                                AppTextStyle.normalHeaderTitle(AppColor.shade3),
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
          ),
        ],
      ),
    );
  }
}
