class UserModel {
  String? userId;
  String? username;
  String? email;
  String? phoneNumber;
  double? totalBalance;
  String? image;

  UserModel(this.userId, this.username, this.email, this.phoneNumber,this.totalBalance, this.image);

  UserModel.fromMap(Map<dynamic,dynamic> data) {
    userId = data["userId"];
    username = data['username'];
    email = data['email'];
    phoneNumber = data["phoneNumber"];
    totalBalance = data['totalBalance'];
    image = data['image'];
  }

  Map<String, dynamic> toJson(){
    final user = {
      "userId": userId ?? "",
      "username": username ?? "",
      "email": email ?? "",
      "phoneNumber": phoneNumber ?? "",
      "totalBalance": totalBalance ?? 0.0,
      "image": image
    };

    return user;
  }
}
