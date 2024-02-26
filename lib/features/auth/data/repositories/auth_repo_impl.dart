import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  ResultFuture<void> sendOtp({required String phoneNumber}) async {
    try {
      await _remoteDataSource.sendOtp(phoneNumber: phoneNumber);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<UserModel?> verifyOtpAndSignIn({required String otp}) async {
    try {
      final response = await _remoteDataSource.verifyOtpAndSignIn(otp: otp);
      if (response != null) {
        _localDataSource.cacheUserData(user: response);
      }
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<bool> registerAccount({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      final response = await _remoteDataSource.registerAccount(
        fullName: fullName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<UserModel?> getUserData() async {
    try {
      final localUserID = await _localDataSource.getCacheUserData();
      UserModel? remoteUser;

      if (localUserID != null) {
        remoteUser = await _remoteDataSource.getUserData(uid: localUserID);
      } else {
        return const Right(null);
      }

      if (remoteUser != null) {
        return Right(remoteUser);
      }
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<void> signOut() async {
    try {
      await _remoteDataSource.signOut();
      await _localDataSource.deleteCacheUserData();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
