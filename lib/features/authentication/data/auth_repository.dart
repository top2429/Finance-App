import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/authentication/domain/userModel.dart';

class AuthRepository {
  /* The following are the local varables for the auth repository */

  String chooseRandomPicture() {
    var myStrings = [
      "one.png",
      "two.png",
      "three.png",
      "four.png",
      "five.png",
      "six.png",
      "seven.png",
      "eight.png",
    ];

    final random = Random();
    return myStrings[random.nextInt(myStrings.length)];
  }

  Future<String> register(String email, String password, String username, String phoneNumber) async {
    String image = chooseRandomPicture();
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(),
              password: password.trim());
      User? user = userCredential.user;
      await FirebaseFirestore.instance.collection('users').add(UserModel(
              user!.uid,
              username.trim(),
              user.email,
              phoneNumber.trim(),
              0.0,
              image)
          .toJson());
          return 'success';
     
    } on FirebaseAuthException catch (e) {
        return e.code;
     
    }
  }
}


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});