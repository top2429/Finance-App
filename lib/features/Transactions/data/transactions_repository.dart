import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/Transactions/domain/transactionsModel.dart';

class TransactionsRepository {
  Stream<List<TransactionsModel>> watchTransactions(String userId) {
    try {
      var query =
          FirebaseFirestore.instance.collection("transactions").where(Filter.or(
                Filter('senderId', isEqualTo: userId),
                Filter('receiverId', isEqualTo: userId),
              ));

      return query.snapshots().map((snapshot) {
        List<TransactionsModel> transactionsList = snapshot.docs
            .map((doc) => TransactionsModel.fromMap(doc.data()))
            .toList();

        transactionsList.sort(((a, b) => b.timestamp!.compareTo(a.timestamp!)));
        return transactionsList;
      });
    } catch (e) {
      return Stream.error(e);
    }
  }
}

final transactionsRepositoryProvider = Provider<TransactionsRepository>((ref) {
  return TransactionsRepository();
});

final transactionsListStreamProvider = StreamProvider.autoDispose
    .family<List<TransactionsModel>, String>((ref, userId) {
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 20), () {
    link.close();
  });
  final transactionsRepo = ref.watch(transactionsRepositoryProvider);
  return transactionsRepo.watchTransactions(userId);
});
