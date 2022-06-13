import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import '../../style_guide/style_guide.dart';

class HeaderHomePage extends StatefulWidget {
  final String? searchText;
  const HeaderHomePage({Key? key, required this.searchText}) : super(key: key);

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String? searchText = widget.searchText;
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
                      "PM",
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
                          border: Border.all(color: ColorGuide().primary4)),
                      child: Row(children: [
                        input("Your vault", FontWeight.w700,
                            ColorGuide().primary4, 14),
                        SizedBox(
                          width: 10,
                        ),
                        sticker(StickerName().wallet, 24)
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
                    icon(IconName().search, ColorGuide().primary4, 24),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type account name",
                        hintStyle:
                            TextStyle(color: ColorGuide().text5, fontSize: 14),
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
  }
}
