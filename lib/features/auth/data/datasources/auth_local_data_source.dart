// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiem_cat_vung_me/core/errors/exception.dart';
import 'package:tiem_cat_vung_me/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUserData({required UserModel user});
  Future<String?> getCacheUserData();
  Future<void> deleteCacheUserData();
}

const USER_ID = "USER_ID";

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> cacheUserData({required UserModel user}) async {
    try {
      _sharedPreferences.setString(USER_ID, user.uid);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<String?> getCacheUserData() async {
    try {
      final response = _sharedPreferences.getString(USER_ID);
      return response != null ? Future.value(response) : Future.value(null);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteCacheUserData() async {
    try {
      await _sharedPreferences.remove(USER_ID);
    } on CacheException {
      throw CacheException();
    }
  }
}
