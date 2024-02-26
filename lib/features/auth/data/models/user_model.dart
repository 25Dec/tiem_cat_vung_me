import '../../../../core/common/entites/sub_entities.dart';
import '../../../../core/enums/enums.dart';
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
    Gender gender;

    if (json["gender"] == Gender.male.toString()) {
      gender = Gender.male;
    } else if (json["gender"] == Gender.female.toString()) {
      gender = Gender.female;
    } else {
      gender = Gender.other;
    }

    return UserModel(
      uid: json["uid"],
      email: json["email"],
      fullName: json["fullName"],
      phoneNumber: json["phoneNumber"],
      gender: gender,
      addresses: List<UserAddressEntity>.from(json["addresses"]),
      favorites: List<String>.from(json["favorites"]),
      cart: List<String>.from(json["cart"]),
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
