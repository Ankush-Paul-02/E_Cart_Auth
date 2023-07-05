import 'package:emart_app/common/background.dart';
import 'package:emart_app/common/lists.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: categories.text.white.fontFamily(bold).make(),
          iconTheme: const IconThemeData(color: whiteColor),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200,
            ),
            itemCount: 9,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryImages[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoryList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(
                    () => Get.to(
                      () => CategoryDetails(
                        title: categoryList[index],
                      ),
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
