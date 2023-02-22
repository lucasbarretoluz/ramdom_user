import 'package:ramdom_user/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:ramdom_user/data/model/user_model.dart';
import 'package:ramdom_user/domain/entities/user_response_entity.dart';
import 'package:ramdom_user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserResponseEntity> getUsers() async {
    try {
      UserResponseModel responseModel = await remoteDataSource.getUsers();
      return UserResponseEntity(users: responseModel.users);
    } catch (e) {
      throw Exception();
    }
  }
}
