import 'package:equatable/equatable.dart';

import 'image_entity.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final ImageEntity imageUrl;
  final String gender;
  final String nat;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
    required this.nat,
  });

  @override
  List<Object?> get props => [firstName];
}
