import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/domain/requests_model.dart';

sendRequest(
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
  await db.collection("requests").add(requestsModel.toJson());
}
