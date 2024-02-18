import '../../../../core/utils/typedefs.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

class GetUserData {
  final AuthRepo _repo;

  GetUserData(this._repo);

  ResultFuture<UserEntity?> execute() async {
    return await _repo.getUserData();
  }
}
