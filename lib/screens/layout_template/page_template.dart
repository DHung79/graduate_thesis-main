import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/widgets/jt_toast.dart';
import '../../main.dart';
import '../../themes/theme.dart';

class PageTemplate extends StatefulWidget {
  final Widget child;
  const PageTemplate({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  final collection = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    JTToast.init(context);
    return Scaffold(
      backgroundColor: AppColor.shade4,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigator(),
    );
  }

  Widget _buildBottomNavigator() {
    return Container(
        height: 106,
        decoration: BoxDecoration(
          color: AppColor.text3,
          boxShadow: [AppBoxShadow.light1],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _navigationItem(
              icon: AppIcons.home,
              route: homeRoute,
            ),
            _navigationItem(
              icon: AppIcons.random,
              route: generatePasswordRoute,
            ),
            _navigationItem(
              icon: AppIcons.settings,
              route: settingRoute,
            ),
          ],
        ));
  }

  Widget _navigationItem({
    required AppIconData icon,
    required String route,
  }) {
    final isActive = ModalRoute.of(context)!.settings.name == route;
    return InkWell(
      splashColor: AppColor.transparent,
      highlightColor: AppColor.transparent,
      onTap: () {
        navigatorTo(context, route);
      },
      child: SizedBox(
        height: 72,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: isActive ? AppColor.primary1 : AppColor.transparent,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AppIcon(
                icon,
                color: isActive ? AppColor.primary1 : AppColor.text5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
