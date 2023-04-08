class UserModel {
  String email;
  int phoneNumber;
  String password;
  String? profilePic;
  String username;
  String address;
  List following;
  List orders;
  List receivedOrders;
  UserModel(
      {required this.email,
      required this.password,
      required this.username,
      required this.phoneNumber,
      required this.address,
      this.profilePic,
      required this.following,
      required this.orders,
      required this.receivedOrders});
}
