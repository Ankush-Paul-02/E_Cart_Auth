import 'package:emart_app/common/home_button.dart';
import 'package:emart_app/common/lists.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:emart_app/view/home/widgets/feature_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      padding: const EdgeInsets.all(12),
      child: SafeArea(
        child: Column(
          children: [
            //! Search Bar
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: search,
                  hintStyle: const TextStyle(color: textfieldGrey),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //! Swiper brands
                    VxSwiper.builder(
                      aspectRatio: 16 / 5,
                      autoPlay: true,
                      viewportFraction: .8,
                      enlargeCenterPage: true,
                      height: 120,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slidersList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    //! Deal buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todayDeal : flashSale,
                        ),
                      ),
                    ),
                    10.heightBox,
                    //! Swiper
                    VxSwiper.builder(
                      aspectRatio: 16 / 5,
                      autoPlay: true,
                      viewportFraction: .8,
                      enlargeCenterPage: true,
                      height: 120,
                      itemCount: slidersList2.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slidersList2[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    //! Category, brand, seller
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 3.5,
                          icon: index == 0
                              ? icTopCategories
                              : index == 1
                                  ? icBrands
                                  : icTopSeller,
                          title: index == 0
                              ? categories
                              : index == 1
                                  ? brand
                                  : toSellers,
                        ),
                      ),
                    ),
                    20.heightBox,
                    //! Featured categories
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              featuredButton(
                                  icon: featureListImg1[index],
                                  title: featureListTitle1[index]),
                              10.heightBox,
                              featuredButton(
                                  icon: featureListImg2[index],
                                  title: featureListTitle2[index]),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //! Featured product
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
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
                          )
                        ],
                      ),
                    ),
                    //! Swiper
                    20.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 5,
                      autoPlay: true,
                      viewportFraction: .8,
                      enlargeCenterPage: true,
                      height: 120,
                      itemCount: slidersList2.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slidersList2[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    //! All product section
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: allProducts.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    20.heightBox,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP5,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
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
                            .make();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
