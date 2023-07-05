import 'package:emart_app/common/applogo_widget.dart';
import 'package:emart_app/common/background.dart';
import 'package:emart_app/common/custom_button.dart';
import 'package:emart_app/common/custom_text_field.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:emart_app/view/auth/controllers/auth_controller.dart';
import 'package:emart_app/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool? isChecked = false;
  var controller = Get.put(AuthController());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                "Join the $appName".text.white.size(18).fontFamily(bold).make(),
                15.heightBox,
                Obx(
                  () => Column(
                    children: [
                      customTextField(
                          hint: nameHint,
                          isObscure: false,
                          title: name,
                          controller: nameController),
                      customTextField(
                          hint: emailHint,
                          title: email,
                          isObscure: false,
                          controller: emailController),
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          isObscure: true,
                          controller: passwordController),
                      customTextField(
                          hint: passwordHint,
                          title: rePassword,
                          isObscure: true,
                          controller: confirmPasswordController),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: forgetPassword.text.color(Vx.blue400).make(),
                        ),
                      ),
                      //! CheckBox
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                            checkColor: whiteColor,
                          ),
                          //! Terms and conditions
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontSize: 12,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: termsAndCon,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontSize: 12,
                                      color: redColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontSize: 12,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: privacy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      fontSize: 12,
                                      color: redColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      5.heightBox,
                      //! Sign up
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : customELevatedButton(
                                  onPress: () async {
                                    if (isChecked != false) {
                                      controller.isLoading(true);
                                      try {
                                        await controller
                                            .signupMethod(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        )
                                            .then((value) {
                                          return controller.storeUserData(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text,
                                          );
                                        }).then((value) {
                                          VxToast.show(context, msg: loggedIn);
                                          Get.offAll(() => const Home());
                                        });
                                      } catch (e) {
                                        auth.signOut();
                                        VxToast.show(context,
                                            msg: e.toString());
                                        controller.isLoading(false);
                                      }
                                    }
                                  },
                                  color: isChecked == true
                                      ? lightGolden
                                      : lightGrey,
                                  textColor: whiteColor,
                                  title: signup)
                              .box
                              .width(context.screenWidth - 50)
                              .make(),
                      10.heightBox,
                      //! Already have an account
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: alreadyHaveAcc,
                              style: TextStyle(
                                fontFamily: bold,
                                fontSize: 12,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                              text: "login",
                              style: TextStyle(
                                fontFamily: bold,
                                fontSize: 12,
                                color: redColor,
                              ),
                            ),
                          ],
                        ),
                      ).onTap(() {
                        Get.back();
                      })
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
