import '../../../../core/utils/typedefs.dart';
import '../repositories/auth_repo.dart';

class SignUpWithEmail {
  final AuthRepo _repo;

  SignUpWithEmail(this._repo);

  ResultFuture<void> execute({
    required String email,
    required String fullName,
    required String password,
  }) async {
    return await _repo.signUpWithEmail(
      email: email,
      fullName: fullName,
      password: password,
    );
  }
}
