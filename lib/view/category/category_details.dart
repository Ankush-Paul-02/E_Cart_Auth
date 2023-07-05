import 'package:emart_app/common/background.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:emart_app/view/category/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: title.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .semiBold
                        .size(12)
                        .color(fontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make(),
                  ),
                ),
              ),
              //! Items container
              20.heightBox,
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP5,
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        "MacBook Air"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        "\$199"
                            .text
                            .color(redColor)
                            .fontFamily(bold)
                            .size(16)
                            .make(),
                      ],
                    )
                        .box
                        .margin(
                          const EdgeInsets.symmetric(horizontal: 4),
                        )
                        .white
                        .outerShadowSm
                        .padding(const EdgeInsets.all(8))
                        .roundedSM
                        .make()
                        .onTap(
                          () => Get.to(
                            () => const ItemDetails(title: "Dummy item"),
                          ),
                        );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
