import '../../../../core/utils/typedefs.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  ResultFuture<void> sendOtp({required String phoneNumber});
  ResultFuture<bool> verifyOtp({required String otp});
  ResultFuture<bool> checkAccountExists({required String phoneNumber});
  ResultFuture<UserEntity> registerAccount({
    required String fullName,
    required String email,
    required String password,
  });
  ResultFuture<void> signOut();
}
