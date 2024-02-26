import '../entites/sub_entities.dart';

class UserAddressModel extends UserAddressEntity {
  const UserAddressModel({
    required super.recipientName,
    required super.phoneNumber,
    required super.cityOrDistrictOrWard,
    required super.streetOrBuildingName,
    required super.unitOrFloor,
    required super.isDefaultAddress,
  });

  factory UserAddressModel.fromJson(Map<String, dynamic> json) {
    return UserAddressModel(
      recipientName: json["recipientName"],
      phoneNumber: json["phoneNumber"],
      cityOrDistrictOrWard: json["cityOrDistrictOrWard"],
      streetOrBuildingName: json["streetOrBuildingName"],
      unitOrFloor: json["unitOrFloor"],
      isDefaultAddress: json["isDefaultAddress"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "recipientName": recipientName,
      "phoneNumber": phoneNumber,
      "cityOrDistrictOrWard": cityOrDistrictOrWard,
      "streetOrBuildingName": streetOrBuildingName,
      "unitOrFloor": unitOrFloor,
      "isDefaultAddress": isDefaultAddress,
    };
  }
}
