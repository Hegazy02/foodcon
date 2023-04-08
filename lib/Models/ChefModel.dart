class ChefModel {
  String email;
  int phoneNumber;
  String password;
  String profilePic;
  String username;
  String address;
  int recipesNumber;
  int followersNumer;
  double rate;

  ChefModel({
    required this.email,
    required this.password,
    required this.username,
    required this.phoneNumber,
    required this.address,
    required this.profilePic,
    required this.recipesNumber,
    required this.followersNumer,
    required this.rate,
  });
}
