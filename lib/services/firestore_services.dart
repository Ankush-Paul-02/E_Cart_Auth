import 'package:emart_app/constants/constants.dart';

class FireStoreServices {
  //! Get users data
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
