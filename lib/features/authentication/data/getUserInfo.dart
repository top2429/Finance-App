

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tai/features/authentication/domain/userModel.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';

Future<bool> getUser(UserNotifier userNotifier)async{

  var db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser;

  var query = await db
      .collection("users")
      .where("userId", isEqualTo: user!.uid).get();

  final data = query.docs;
  UserModel userObject = UserModel.fromMap(data[0].data());
  userNotifier.setUser(userObject);

  return true;
}