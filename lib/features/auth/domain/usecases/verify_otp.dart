import '../../../../core/utils/typedefs.dart';
import '../repositories/auth_repo.dart';

class VerifyOtp {
  final AuthRepo _repo;

  VerifyOtp(this._repo);

  ResultFuture<bool> execute({required String otp}) async {
    return await _repo.verifyOtp(otp: otp);
  }
}
