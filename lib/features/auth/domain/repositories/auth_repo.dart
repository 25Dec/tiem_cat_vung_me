import '../../../../core/utils/typedefs.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  ResultFuture<void> sendOtp({required String phoneNumber});
  ResultFuture<UserEntity?> verifyOtpAndSignIn({required String otp});
  ResultFuture<bool> registerAccount({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  });
  ResultFuture<UserEntity?> getUserData();
  ResultFuture<void> signOut();
}
