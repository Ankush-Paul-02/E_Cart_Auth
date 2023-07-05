import 'package:emart_app/common/applogo_widget.dart';
import 'package:emart_app/common/background.dart';
import 'package:emart_app/common/custom_button.dart';
import 'package:emart_app/common/custom_text_field.dart';
import 'package:emart_app/common/lists.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:emart_app/view/auth/controllers/auth_controller.dart';
import 'package:emart_app/view/auth/signup_page.dart';
import 'package:emart_app/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: backgroundWidget(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                appLogoWidget(),
                10.heightBox,
                "Login to $appName".text.white.size(18).fontFamily(bold).make(),
                15.heightBox,
                Obx(
                  () => Column(
                    children: [
                      customTextField(
                          hint: emailHint,
                          title: email,
                          controller: controller.emailController,
                          isObscure: false),
                      customTextField(
                          hint: passwordHint,
                          controller: controller.passwordController,
                          title: password,
                          isObscure: true),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: forgetPassword.text.color(Vx.blue400).make(),
                        ),
                      ),
                      5.heightBox,
                      //! Login button
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : customELevatedButton(
                              onPress: () async {
                                controller.isLoading(true);
                                await controller
                                    .loginMethod(context: context)
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context, msg: loggedIn);
                                    Get.offAll(() => const Home());
                                  } else {
                                    controller.isLoading(false);
                                  }
                                });
                              },
                              color: redColor,
                              textColor: whiteColor,
                              title: login,
                            ).box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      createNewAccount.text.color(fontGrey).make(),
                      5.heightBox,
                      //! Signup button
                      customELevatedButton(
                        onPress: () {
                          Get.to(
                            () => const SignupPage(),
                          );
                        },
                        color: lightGolden,
                        textColor: whiteColor,
                        title: signup,
                      ).box.width(context.screenWidth - 50).make(),
                      20.heightBox,
                      loginWith.text.color(fontGrey).make(),
                      5.heightBox,
                      //! Social login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIconsList[index],
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                      .box
                      .white
                      .padding(const EdgeInsets.all(16))
                      .shadowSm
                      .width(context.screenWidth - 65)
                      .rounded
                      .make(),
                ),
                10.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
