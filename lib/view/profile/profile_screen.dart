import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/common/background.dart';
import 'package:emart_app/common/lists.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/view/auth/controllers/auth_controller.dart';
import 'package:emart_app/view/auth/login_page.dart';
import 'package:emart_app/view/profile/edit_profile_screen.dart';
import 'package:emart_app/view/profile/widgets/details_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return backgroundWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: StreamBuilder(
            stream: FireStoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      redColor,
                    ),
                  ),
                );
              } else {
                final data = snapshot.data!.docs[0];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //! Edit profile button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                        ),
                      ).onTap(() {
                        controller.nameController.text = data['name'];
                        controller.passwordController.text = data['password'];
                        Get.to(() => EditProfileScreen(data: data));
                      }),
                    ),
                    //! User details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          data['imageUrl'] == ''
                              ? const Icon(
                                  Icons.person_sharp,
                                  size: 60,
                                )
                                  .box
                                  .white
                                  .clip(Clip.antiAlias)
                                  .p12
                                  .roundedFull
                                  .make()
                              : Image.network(data['imageUrl'],
                                      width: 60, fit: BoxFit.cover)
                                  .box
                                  .white
                                  .clip(Clip.antiAlias)
                                  .p12
                                  .roundedFull
                                  .make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .white
                                    .size(18)
                                    .fontFamily(semibold)
                                    .make(),
                                "${data['email']}"
                                    .text
                                    .size(16)
                                    .fontFamily(semibold)
                                    .white
                                    .make()
                              ],
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () async {
                              await Get.put(AuthController()).signOutMethod();
                              Get.offAll(() => const LoginPage());
                            },
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                              color: whiteColor,
                            )),
                            child:
                                logout.text.fontFamily(semibold).white.make(),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    //! three button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(
                            count: "${data['cart_count']}",
                            title: "in your cart",
                            width: context.screenWidth / 3.4),
                        detailsCard(
                            count: "${data['wishlist_count']}",
                            title: "in your wishlist",
                            width: context.screenWidth / 3.4),
                        detailsCard(
                            count: "${data['order_count']}",
                            title: "your orders",
                            width: context.screenWidth / 3.4),
                      ],
                    ),
                    //! Buttons section
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: profileButtonList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(color: lightGrey);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: profileButtonList[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          leading: Image.asset(
                            profileButtonIcons[index],
                            width: 22,
                          ),
                        );
                      },
                    )
                        .box
                        .white
                        .rounded
                        .margin(const EdgeInsets.all(12))
                        .shadowSm
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make()
                        .box
                        .color(redColor)
                        .make(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
