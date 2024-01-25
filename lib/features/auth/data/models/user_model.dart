import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.fullName,
    required super.password,
    required super.phoneNumber,
    super.gender,
    super.addresses,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
      email: json["email"],
      fullName: json["fullName"],
      password: json["password"],
      phoneNumber: json["phoneNumber"],
      gender: json["gender"],
      addresses: json["addresses"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "fullName": fullName,
      "password": password,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "addresses": addresses,
    };
  }
}
