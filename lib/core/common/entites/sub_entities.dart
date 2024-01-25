import 'package:equatable/equatable.dart';

class UserAddress extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String address;
  final bool isDefaultAddress;

  const UserAddress({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.isDefaultAddress,
  });

  @override
  List<Object?> get props => [fullName, phoneNumber, address, isDefaultAddress];
}
