import 'dart:io';
import 'package:emart_app/common/background.dart';
import 'package:emart_app/common/custom_button.dart';
import 'package:emart_app/common/custom_text_field.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return backgroundWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ? const Icon(
                      Icons.person_sharp,
                      size: 60,
                    )
                      .box
                      .white
                      .p12
                      .border(color: Colors.black54)
                      .clip(Clip.antiAlias)
                      .roundedFull
                      .make()
                  : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        )
                          .box
                          .clip(Clip.antiAlias)
                          .roundedFull
                          .border(color: Colors.black45)
                          .make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        )
                          .box
                          .clip(Clip.antiAlias)
                          .roundedFull
                          .border(color: Colors.black45)
                          .make(),
              10.heightBox,
              customELevatedButton(
                  color: redColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  title: "Change",
                  textColor: whiteColor),
              const Divider(),
              20.heightBox,
              customTextField(
                  title: name,
                  hint: "nameHint",
                  isObscure: false,
                  controller: controller.nameController),
              customTextField(
                  title: password,
                  hint: "passwordHint",
                  isObscure: true,
                  controller: controller.passwordController),
              20.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: customELevatedButton(
                          color: redColor,
                          onPress: () {
                            controller.isLoading(true);
                            controller.uploadProfileImage();
                            controller.updateProfile(
                              name: controller.nameController.text,
                              password: controller.passwordController.text,
                              profileImgUrl: controller.profileImgUrl,
                            );
                            VxToast.show(context, msg: "Profile Updated");
                          },
                          title: "Save",
                          textColor: whiteColor),
                    ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    );
  }
}
