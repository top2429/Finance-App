import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/bottomNavBar/presentation/Transactions/domain/transactionsModel.dart';

class TransactionsRepository {
  Stream<List<TransactionsModel>> watchTransactions(String userId) {
    try {
      var query =
          FirebaseFirestore.instance.collection("transactions").where(Filter.or(
                Filter('senderId', isEqualTo: userId),
                Filter('receiverId', isEqualTo: userId),
              ));

      /// see the documentation of the first .map [transaforms Stream<Querysnapshot> into Stream<List<Transactions>>]
      return query.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => TransactionsModel.fromMap(doc.data()))
          .toList());
    } catch (e) {
      print("There is an error: $e");
      // Handle the error or return an error stream
      return Stream.error(e);
    }
  }
}

final transactionsRepositoryProvider = Provider<TransactionsRepository>((ref) {
  return TransactionsRepository();
});

final transactionsListStreamProvider = StreamProvider.autoDispose
    .family<List<TransactionsModel>, String>((ref, userId) {
    /* caching method to keep the provider and stream
    alive for some time before disposing it */
    final link =  ref.keepAlive();
    Timer(const Duration(seconds: 20 ), () {
      link.close();
     });
  final transactionsRepo = ref.watch(transactionsRepositoryProvider);
  return transactionsRepo.watchTransactions(userId);
});

