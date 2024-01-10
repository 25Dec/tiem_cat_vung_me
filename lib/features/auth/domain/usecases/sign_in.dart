import '../../../../core/utils/typedefs.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

class SignIn {
  final AuthRepo _repo;

  SignIn(this._repo);

  ResultFuture<UserEntity> execute({
    required String email,
    required String password,
  }) async {
    return await _repo.signIn(
      email: email,
      password: password,
    );
  }
}
