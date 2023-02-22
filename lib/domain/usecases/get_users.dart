import 'package:ramdom_user/domain/entities/user_response_entity.dart';

import '../../core/usecase/base_usecase.dart';
import '../repositories/user_repository.dart';

class GetUsers extends BaseUseCase<Future<UserResponseEntity>> {
  final UserRepository _repo;

  GetUsers(this._repo);

  @override
  Future<UserResponseEntity> execute() async {
    return await _repo.getUsers();
  }
}

class Params {
  final String? gender;
  const Params(
    this.gender,
  );
}
