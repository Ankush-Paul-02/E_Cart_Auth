import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //? Loading
  final isLoading = false.obs;

  //? Text Editing Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //? Login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //? Signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //? Sign Out method
  signOutMethod({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  //? Storing data method
  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count': "00",
      'order_count': "00",
      'wishlist_count': "00",
    });
  }
}
