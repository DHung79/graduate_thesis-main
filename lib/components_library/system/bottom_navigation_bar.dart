import 'package:flutter/material.dart';
import 'package:graduate_thesis/style_guide/style_guide.dart';
import 'package:graduate_thesis/themes/app_colors.dart';
import 'package:graduate_thesis/themes/app_icons.dart';
import '../../main.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<AppBottomNavigationBar> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72,
        decoration: BoxDecoration(
            color: ColorGuide().text3, boxShadow: [Shadow().light1]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navigationItem(IconName().home, 0, "/"),
            navigationItem(IconName().random, 1, '/generatePasswordHomePage'),
            navigationItem(IconName().settings, 2, "/settings"),
          ],
        ));
  }

  Widget navigationItem(String logo, int index, String pageRoute) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedPage = index;
            navigatorTo(context, pageRoute);
          });
        },
        child: Container(
          height: 72,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                  color: (index == selectedPage)
                      ? ColorGuide().primary1
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            AppIcon(
              AppIcons.lock,
              color: index == selectedPage ? AppColor.primary1 : AppColor.text5,
            ),
          ]),
        ));
  }
}

// class BottomNavigationBarVariants {
//   Widget home =
//       Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//     navigationItem(icon(IconName().home, ColorGuide().primary1, 24),
//         ColorGuide().primary1, 0),
//     navigationItem(
//         icon(IconName().random, ColorGuide().text5, 24), Colors.transparent, 1),
//     navigationItem(icon(IconName().settings, ColorGuide().text5, 24),
//         Colors.transparent, 2),
//   ]);
//   Widget generatePassword =
//       Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//     navigationItem(
//         icon(IconName().home, ColorGuide().text5, 24), Colors.transparent, 0),
//     navigationItem(icon(IconName().random, ColorGuide().primary1, 24),
//         ColorGuide().primary1, 1),
//     navigationItem(icon(IconName().settings, ColorGuide().text5, 24),
//         Colors.transparent, 2),
//   ]);
//   Widget settings =
//       Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//     navigationItem(
//         icon(IconName().home, ColorGuide().text5, 24), Colors.transparent, 0),
//     navigationItem(
//         icon(IconName().random, ColorGuide().text5, 24), Colors.transparent, 1),
//     navigationItem(icon(IconName().settings, ColorGuide().primary1, 24),
//         ColorGuide().primary1, 2),
//   ]);

//   changeNavigate(int signal) {
//     if (signal == 0) {
//       log("Navigation: 0");
//       return home;
//     }
//     if (signal == 1) {
//       log("Navigation: 1");
//       return generatePassword;
//     }
//     if (signal == 2) {
//       log("Navigation: 2");
//       return settings;
//     }
//   }
// }
