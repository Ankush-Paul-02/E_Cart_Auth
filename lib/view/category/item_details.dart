import 'package:emart_app/common/custom_button.dart';
import 'package:emart_app/common/lists.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: title.text.color(darkFontGrey).bold.make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! swiper section
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    //! title and details
                    title.text.size(16).color(darkFontGrey).semiBold.make(),
                    10.heightBox,
                    //! Rating
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      size: 25,
                      count: 5,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,000".text.color(redColor).bold.make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Seller".text.white.semiBold.make(),
                              5.heightBox,
                              "In house Brands"
                                  .text
                                  .semiBold
                                  .color(darkFontGrey)
                                  .make(),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child:
                              Icon(Icons.message_rounded, color: darkFontGrey),
                        ),
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),
                    20.heightBox,
                    Column(
                      children: [
                        //! Color
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .color(Vx.randomPrimaryColor)
                                    .roundedFull
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 8))
                                    .make(),
                              ),
                            )
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.symmetric(horizontal: 8))
                            .make(),
                        //! Quantity
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                                "0"
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .bold
                                    .make(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ],
                            )
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.symmetric(horizontal: 8))
                            .make(),
                        //! Total
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(textfieldGrey).make(),
                            ),
                            "\$0.00".text.color(redColor).size(16).bold.make(),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.symmetric(horizontal: 8))
                            .make(),
                        20.heightBox,
                      ],
                    ).box.white.shadowSm.make(),
                    10.heightBox,
                    //! Description section
                    "Description".text.color(darkFontGrey).semiBold.make(),
                    10.heightBox,
                    "This is a dummy item description here..."
                        .text
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    //! Button section
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        itemDetailsButton.length,
                        (index) => ListTile(
                          title: itemDetailsButton[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                    10.heightBox,
                    productYouMayLike.text
                        .size(16)
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .make(),
                    20.heightBox,
                    //! Featured product
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          6,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgB1,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
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
                              .padding(const EdgeInsets.all(8))
                              .roundedSM
                              .make(),
                        ),
                      ),
                    ),
                    20.heightBox,
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: customELevatedButton(
              onPress: () {},
              color: redColor,
              textColor: whiteColor,
              title: "Add to cart",
            ),
          )
        ],
      ),
    );
  }
}
