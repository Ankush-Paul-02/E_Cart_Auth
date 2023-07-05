import 'package:emart_app/constants/constants.dart';
import 'package:emart_app/view/splash_page/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EMART',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
        iconTheme: const IconThemeData(color: darkFontGrey),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Vx.white),
        ),
        fontFamily: regular,
      ),
      home: const SplashPage(),
    );
  }
}
