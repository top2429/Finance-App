class TransactionsModel {
  String? senderId;
  String? senderName;
  String? receiverId;
  double? amount;

  TransactionsModel(this.senderId, this.senderName,this.receiverId, this.amount);

  TransactionsModel.fromMap(Map<String, dynamic> data) {
    senderId = data['senderId'];
    senderName = data['senderName'];
    receiverId = data['receiverId'];
    amount = data['amount'];
  }

  Map<String, dynamic> toJson() {
    final transactionsModel = {
      "senderId": senderId,
      "senderName":senderName,
      "receiverId": receiverId,
      "amount": amount
    };

    return transactionsModel;
  }
}
