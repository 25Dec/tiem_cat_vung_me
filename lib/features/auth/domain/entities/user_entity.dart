import 'package:equatable/equatable.dart';

import '../../../../core/common/entites/sub_entities.dart';
import '../../../../core/enums/enums.dart';

class UserEntity extends Equatable {
  final String uid;
  final String email;
  final String fullName;
  final String phoneNumber;
  final Gender? gender;
  final List<UserAddress>? addresses;
  final List<String>? favorites;
  final List<String>? cart;
  // final List<UserPurchaseOrderEntity>? purchaseOrders;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    this.gender = Gender.other,
    this.addresses = const [],
    this.favorites = const [],
    this.cart = const [],
  });

  @override
  List<Object?> get props => [uid, email];
}
