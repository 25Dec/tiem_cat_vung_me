import '../../../../core/utils/typedefs.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

class RegisterAccount {
  final AuthRepo _repo;

  RegisterAccount(this._repo);

  ResultFuture<UserEntity> execute({
    required String fullName,
    required String email,
    required String password,
  }) async {
    return await _repo.registerAccount(
        fullName: fullName, email: email, password: password);
  }
}
