
import '../entities/user_response_entity.dart';

abstract class UserRepository{
  Future<UserResponseEntity> getUsers();
}