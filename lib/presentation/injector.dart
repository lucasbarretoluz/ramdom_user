import 'package:ramdom_user/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:ramdom_user/data/repositories/user_repository_impl.dart';
import 'package:ramdom_user/domain/repositories/user_repository.dart';
import 'package:ramdom_user/domain/usecases/get_users.dart';

class Injector {
  static RemoteDataSource remoteDataSource = RemoteDataSource(http.Client());
  static UserRepository userRepository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
  static GetUsers getUsersUsecase = GetUsers(userRepository);
}