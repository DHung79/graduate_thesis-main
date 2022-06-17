import 'package:flutter/material.dart';
import '/main.dart';
import '../../themes/theme.dart';

class PageNotFoundScreen extends StatefulWidget {
  final String route;
  const PageNotFoundScreen(this.route, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PageNotFoundScreenState();
}

class _PageNotFoundScreenState extends State<PageNotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary1,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
          onTap: () {
            navigatorTo(context, homeRoute);
          },
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.report_gmailerrorred_outlined,
            size: 120,
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              'Page not found',
              style: AppTextStyle.bigText(AppColor.black),
            ),
          ),
        ],
      ),
    );
  }
}
