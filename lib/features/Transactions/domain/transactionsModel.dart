import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionsModel {
  String? senderId;
  String? senderName;
  String? senderImage;
  String? receiverId;
  String? receiverName;
  String? receiverImage;
  double? amount;
  String? time;
  Timestamp? timestamp;

  TransactionsModel(this.senderId, this.senderName, this.senderImage,this.receiverId, this.receiverName,this.receiverImage,this.amount, this.time, this.timestamp);

  TransactionsModel.fromMap(Map<String, dynamic> data) {
    senderId = data['senderId'];
    senderName = data['senderName'];
    senderImage = data['senderImage'];
    receiverId = data['receiverId'];
    receiverName = data['receiverName'];
    receiverImage = data['receiverImage'];
    amount = data['amount'];
    time = data['time'];
    timestamp = data['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final transactionsModel = {
      "senderId": senderId,
      "senderName":senderName,
      "senderImage":senderImage,
      "receiverId": receiverId,
      "receiverName": receiverName,
      "receiverImage":receiverImage,
      "amount": amount,
      "time":time,
      "timestamp":timestamp
    };

    return transactionsModel;
  }
}
