import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/authentication/domain/userModel.dart';
import 'package:tai/features/authentication/presentation/current_user_controller.dart';

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

  Future<String> register(String email, String password, String username,
      String phoneNumber) async {
    String image = chooseRandomPicture();
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
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

  Future<String> signIn(String email, String password, WidgetRef ref) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      bool doneGettingUser = await getUser(ref);
      if (doneGettingUser) {
        return "success";
        
      } else {
        return "fail";
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
     
    }
  }

  Future<bool> getUser(WidgetRef ref) async {
    var db = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;

    var query = await db
        .collection("users")
        .where("userId", isEqualTo: user!.uid)
        .get();

    final data = query.docs;
    ref.read(currentUserControllerProvider.notifier).updateCurrentUser(data[0].data());
    return true;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
