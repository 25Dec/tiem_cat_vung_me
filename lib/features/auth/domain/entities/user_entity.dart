import 'package:equatable/equatable.dart';
import 'package:tiem_cat_vung_me/core/enums/enums.dart';

import 'sub_entities.dart';

class UserEntity extends Equatable {
  final String uid;
  final String email;
  final String fullName;
  final String password;
  final String? phoneNumber;
  final Gender? gender;
  final List<UserAddress>? addresses;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.password,
    this.phoneNumber = "",
    this.gender = Gender.other,
    this.addresses = const [],
  });

  // final List<UserFavoritesEntity>? favorites;
  // final List<UserCartEntity>? cart;
  // final List<UserPurchaseOrderEntity>? purchaseOrders;
  @override
  List<Object?> get props => [uid, email];
}
