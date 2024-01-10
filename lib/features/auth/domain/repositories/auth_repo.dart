import '../../../../core/utils/typedefs.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  ResultFuture<UserEntity> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUpWithEmail({
    required String email,
    required String fullName,
    required String password,
  });
}
