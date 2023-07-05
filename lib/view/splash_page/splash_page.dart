import 'package:emart_app/common/applogo_widget.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:emart_app/view/auth/login_page.dart';
import 'package:emart_app/view/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  navigateToLoginPage() {
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(
            () => const LoginPage(),
          );
        } else {
          Get.to(
            () => const Home(),
          );
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToLoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            20.heightBox,
            appLogoWidget(),
            10.heightBox,
            appName.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appVersion.text.white.make(),
            const Spacer(),
            credits.text.semiBold.white.make(),
            30.heightBox
          ],
        ),
      ),
    );
  }
}
