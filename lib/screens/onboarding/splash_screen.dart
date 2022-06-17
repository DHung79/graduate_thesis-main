import 'package:flutter/material.dart';
import 'package:graduate_thesis/routes/route_names.dart';
import '../../main.dart';
import '../../themes/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
                    image: AssetImage(AppImages.splash),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            color: AppColor.text4, shape: BoxShape.circle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 12,
                          width: 45,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: Column(
                      children: [
                        Text(
                          'Manage all of your',
                          style:
                              AppTextStyle.normalHeaderTitle(AppColor.shade3),
                        ),
                        Text(
                          'Accounts',
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 45, 16, 89),
                    child: AppButton.roundedButton(
                        color: AppColor.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcon(
                              AppIcons.checkCir,
                              color: AppColor.primary1,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                'Start',
                                style: AppTextStyle.headerTitle(
                                  AppColor.primary1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          navigatorTo(context, signInRoute);
                        }),
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
