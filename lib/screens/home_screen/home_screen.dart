import 'package:flutter/material.dart';
import 'package:graduate_thesis/components_library/system/bottom_navigation_bar.dart';
import 'package:graduate_thesis/style_guide/style_guide.dart';

import 'category.dart';
import 'header.dart';
import 'recent.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String? searchText;
    return Scaffold(
      backgroundColor: ColorGuide().shade4,
      bottomNavigationBar: AppBottomNavigationBar(),
      body: Stack(children: [
        ListView(
          children: [
            SizedBox(
              height: 124,
            ),
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CategoryFeature(),
                SizedBox(
                  height: 24,
                ),
                RecentAccountFeature()
              ],
            ),
            SizedBox(
              height: 300,
            )
          ],
        ),
        HeaderHomePage(
          searchText: searchText,
        ),
      ]),
    );
  }
}
