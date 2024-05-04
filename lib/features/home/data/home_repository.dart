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
      // the .map on the querysnapshots helps to transaform the strean to a 
      //preferred type from Stream<Querysnapshots> to Stream<T>
      final response = query.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList()[0]);

      return response;
    } catch (e) {
     
      // Handle the error or return an error stream
      return Stream.error(e);
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

final userModelStreamProvider =
    StreamProvider.autoDispose.family<UserModel, String>((ref, userId) {
  /* caching method to keep the provider and stream
    alive for some time before disposing it */
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 20), () {
    link.close();
  });
  final homeRepo = ref.watch(homeRepositoryProvider);
  return homeRepo.watchUser(userId);
});
