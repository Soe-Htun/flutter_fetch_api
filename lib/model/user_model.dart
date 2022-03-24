import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  String? name;
  String? email;

  UserModel({
    this.name,
    this.email
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email']
    );
  }

  // UserModel.fromMap(DocumentSnapshot data) {
  //   name = data["name"];
  //   email = data["email"];
  // }
}