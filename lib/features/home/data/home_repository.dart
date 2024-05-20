import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/authentication/domain/userModel.dart';

class HomeRepository {
  Stream<UserModel> watchUser(String userId) {
    try {
      var query = FirebaseFirestore.instance.collection("users").where(
            'userId',
            isEqualTo: userId,
          );
      final response = query.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList()[0]);

      return response;
    } catch (e) {
      return Stream.error(e);
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

final userModelStreamProvider =
    StreamProvider.autoDispose.family<UserModel, String>((ref, userId) {
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 20), () {
    link.close();
  });
  final homeRepo = ref.watch(homeRepositoryProvider);
  return homeRepo.watchUser(userId);
});
