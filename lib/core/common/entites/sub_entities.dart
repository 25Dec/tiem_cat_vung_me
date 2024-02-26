import 'package:equatable/equatable.dart';

class UserAddressEntity extends Equatable {
  final String recipientName;
  final String phoneNumber;
  final String cityOrDistrictOrWard;
  final String streetOrBuildingName;
  final String unitOrFloor;
  final String additionalAddressInformation;
  final bool isDefaultAddress;

  const UserAddressEntity({
    required this.recipientName,
    required this.phoneNumber,
    required this.cityOrDistrictOrWard,
    required this.streetOrBuildingName,
    required this.unitOrFloor,
    this.additionalAddressInformation = "",
    required this.isDefaultAddress,
  });

  @override
  List<Object?> get props => [
        recipientName,
        phoneNumber,
        cityOrDistrictOrWard,
        streetOrBuildingName,
        unitOrFloor,
        isDefaultAddress,
      ];
}
