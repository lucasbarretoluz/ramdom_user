import 'package:equatable/equatable.dart';

import 'image_entity.dart';
import 'location_entity.dart';
import 'name_entity.dart';

class UserEntity extends Equatable {
  // final String id;
  final NameEntity name;
  final LocationEntity location;
  final String email;
  final String phone;
  final ImageEntity imageUrl;
  final String gender;
  final String nat;

  const UserEntity({
    // required this.id,
    required this.name,
    required this.location,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
    required this.nat,
  });

  @override
  List<Object?> get props => [name.first];
}
