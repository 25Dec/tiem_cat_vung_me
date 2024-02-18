// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiem_cat_vung_me/core/errors/exception.dart';
import 'package:tiem_cat_vung_me/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUserData({required UserModel user});
  Future<UserModel?> getCacheUserData();
}

const USER_INFO = "USER_INFO";

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> cacheUserData({required UserModel user}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getCacheUserData() {
    try {
      final response = _sharedPreferences.getString(USER_INFO);

      if (response != null) {
        return Future.value(UserModel.fromJson(json.decode(response)));
      } else {
        return Future.value(null);
      }
    } on CacheException {
      throw CacheException();
    }
  }
}
