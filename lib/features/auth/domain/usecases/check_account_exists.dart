import '../../../../core/utils/typedefs.dart';
import '../repositories/auth_repo.dart';

class CheckUserData {
  final AuthRepo _repo;

  CheckUserData(this._repo);

  ResultFuture<bool> execute({required String phoneNumber}) async {
    return await _repo.checkAccountExists(phoneNumber: phoneNumber);
  }
}
