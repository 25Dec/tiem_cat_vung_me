import '../../../../core/utils/typedefs.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

class VerifyOtpAndSignIn {
  final AuthRepo _repo;

  VerifyOtpAndSignIn(this._repo);

  ResultFuture<UserEntity?> execute({required String otp}) async {
    return await _repo.verifyOtpAndSignIn(otp: otp);
  }
}
