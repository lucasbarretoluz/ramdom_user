import 'package:ramdom_user/domain/entities/user_response_entity.dart';

import '../../core/usecase/base_usecase.dart';
import '../repositories/user_repository.dart';

class GetUsers extends BaseUseCase<Future<UserResponseEntity>, Params> {
  final UserRepository _repo;

  GetUsers(this._repo);

  @override
  Future<UserResponseEntity> execute(Params params) async {
    return await _repo.getUsers(params.url);
  }
}

class Params {
  final String? url;
  const Params(
    this.url,
  );
}
