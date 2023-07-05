import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/constants/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  var profileImgPath = ''.obs;
  var profileImgUrl = '';

  var isLoading = false.obs;

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);

      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var fileName = basename(profileImgPath.value);
    var destination = 'images/${currentUser!.uid}/$fileName';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImgUrl = await ref.getDownloadURL();
  }

  updateProfile({name, password, profileImgUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set(
        {'name': name, 'password': password, 'imageUrl': profileImgUrl},
        SetOptions(merge: true));
    isLoading(false);
  }
}
