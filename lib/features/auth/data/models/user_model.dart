import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.fullName,
    required super.phoneNumber,
    super.gender,
    super.addresses,
    super.favorites,
    super.cart,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
      email: json["email"],
      fullName: json["fullName"],
      phoneNumber: json["phoneNumber"],
      gender: json["gender"],
      addresses: json["addresses"],
      favorites: json["favorites"],
      cart: json["cart"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "gender": gender.toString(),
      "addresses": addresses,
      "favorites": favorites,
      "cart": cart,
    };
  }
}
