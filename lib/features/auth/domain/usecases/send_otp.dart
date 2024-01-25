import '../../../../core/utils/typedefs.dart';
import '../repositories/auth_repo.dart';

class SendOtp {
  final AuthRepo _repo;

  SendOtp(this._repo);

  ResultFuture<void> execute({required String phoneNumber}) async {
    return await _repo.sendOtp(phoneNumber: phoneNumber);
  }
}
