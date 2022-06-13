import 'package:flutter/material.dart';
import 'package:graduate_thesis/style_guide/style_guide.dart';

class CategoryFeature extends StatelessWidget {
  const CategoryFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: input("Category", FontWeight.w700, ColorGuide().primary1, 16),
        ),
        SizedBox(
          height: 16,
        ),

        //Category
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Wrap(
                runSpacing: 16,
                children: [
                  categoryItem("Social Media",
                      sticker(StickerName().socialMedia, 40), screenWidth),
                  categoryItem(
                      "Games", sticker(StickerName().games, 40), screenWidth),
                  categoryItem(
                      "Work", sticker(StickerName().works, 40), screenWidth),
                  categoryItem(
                      "Others", sticker(StickerName().others, 40), screenWidth),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

Widget categoryItem(String name, Widget icon, double screenWidth) {
  return Container(
    width: 100,
    child: GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: ColorGuide().text3,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [Shadow().light1]),
            child: icon,
          ),
          SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(
              color: ColorGuide().text1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}
