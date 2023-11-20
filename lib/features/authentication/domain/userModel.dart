class UserModel {
  String? userId;
  String? username;
  String? email;
  String? phoneNumber;
  double? totalBalance;

  UserModel(this.userId, this.username, this.email, this.phoneNumber,this.totalBalance);

  UserModel.fromMap(Map<dynamic,dynamic> data) {
    userId = data["userID"];
    username = data['username'];
    email = data['email'];
    phoneNumber = data["phoneNumber"];
    totalBalance = data['totalBalance'];
  }

  Map<String, dynamic> toJson(){
    final user = {
      "userId": userId ?? "",
      "username": username ?? "",
      "email": email ?? "",
      "phoneNumber": phoneNumber ?? "",
      "totalBalance": totalBalance ?? 0.0
    };

    return user;
  }
}
