import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/domain/requests_model.dart';

class RequestsRepository{
  Future<bool> sendRequest(
    String senderId,
    String senderName,
    String senderImage,
    String receiverId,
    String receiverName,
    String receiverImage,
    double amount,
    String time,
    String reason) async {
  var db = FirebaseFirestore.instance;

  RequestsModel requestsModel = RequestsModel(senderId, senderName, senderImage,
      receiverId, receiverName, receiverImage, amount, time, reason);
  try {
    await db.collection("requests").add(requestsModel.toJson());
    return true;
  } catch (e) {
    return false;
  }
}

Stream<List<RequestsModel>> watchRequests(String userId){
  try {
      var query =
          FirebaseFirestore.instance.collection("requests").where(Filter.or(
                Filter('senderId', isEqualTo: userId),
                Filter('receiverId', isEqualTo: userId),
              ));
      /// see the documentation of the first .map [transforms Stream<Querysnapshot> into Stream<List<requestsModel>>]
      return query.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => RequestsModel.fromMap(doc.data()))
          .toList());
    } catch (e) {
      return Stream.error(e);
    }
}
}

final requestsrepositoryProvider = Provider<RequestsRepository>((ref) {
  return RequestsRepository() ;
});

final requestsListStreamProvider = StreamProvider.autoDispose
    .family<List<RequestsModel>, String>((ref, userId) {
    /* caching method to keep the provider and stream
    alive for some time before disposing it */
    final link =  ref.keepAlive();
    Timer(const Duration(seconds: 20 ), () {
      link.close();
     });
  final requestsRepo = ref.watch(requestsrepositoryProvider);
  return requestsRepo.watchRequests(userId);
});