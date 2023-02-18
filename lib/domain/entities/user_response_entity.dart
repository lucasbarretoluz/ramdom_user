import 'package:equatable/equatable.dart';
import 'package:ramdom_user/domain/entities/user_entity.dart';

class UserResponseEntity extends Equatable {
  final List<UserEntity> users;

  const UserResponseEntity({required this.users});

  @override
  List<Object?> get props => [users];
}
