import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  ResultFuture<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );

      return Right(response);
    } on ServerException catch (e) {
      throw Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<void> signUpWithEmail({
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      await _remoteDataSource.signUpWithEmail(
        email: email,
        fullName: fullName,
        password: password,
      );
      return const Right(null);
    } on ServerException catch (e) {
      throw Left(ServerFailure(message: e.message));
    }
  }
}
