class RequestsModel {
  String? senderId;
  String? senderName;
  String? senderImage;
  String? receiverId;
  String? receiverName;
  String? receiverImage;
  double? amount;
  String? time;
  String? reason;

  RequestsModel(this.senderId, this.senderName, this.senderImage,this.receiverId, this.receiverName,this.receiverImage,this.amount, this.time, this.reason);

  RequestsModel.fromMap(Map<String, dynamic> data) {
    senderId = data['senderId'];
    senderName = data['senderName'];
    senderImage = data['senderImage'];
    receiverId = data['receiverId'];
    receiverName = data['receiverName'];
    receiverImage = data['receiverImage'];
    amount = data['amount'];
    time = data['time'];
    reason = data['reason'];
  }

  Map<String, dynamic> toJson() {
    final requestsModel = {
      "senderId": senderId,
      "senderName":senderName,
      "senderImage":senderImage,
      "receiverId": receiverId,
      "receiverName": receiverName,
      "receiverImage":receiverImage,
      "amount": amount,
      "time":time,
      "reason":reason
    };

    return requestsModel;
  }
}
