import '../../../../core/utils/typedefs.dart';
import '../repositories/auth_repo.dart';

class RegisterAccount {
  final AuthRepo _repo;

  RegisterAccount(this._repo);

  ResultFuture<bool> execute({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    return await _repo.registerAccount(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }
}
