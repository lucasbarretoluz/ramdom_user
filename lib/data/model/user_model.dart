import 'package:ramdom_user/domain/entities/street_entity.dart';
import 'package:ramdom_user/domain/entities/user_response_entity.dart';
import 'dart:convert';

import '../../domain/entities/image_entity.dart';
import '../../domain/entities/user_entity.dart';

class UserResponseModel extends UserResponseEntity {
  const UserResponseModel({
    required this.users,
  }) : super(users: users);

  final List<UserModel> users;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        users: List<UserModel>.from(
            json['results'].map((x) => UserModel.fromJson(json))),
      );
}

class UserModel extends UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final ImageModel imageUrl;
  final String gender;
  final String nat;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
    required this.nat,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          imageUrl: imageUrl,
          gender: gender,
          nat: nat,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['login']['uid'] ?? "",
        firstName: json['login']['uid'] ?? "",
        lastName: json['login']['uid'] ?? "",
        email: json['email'],
        phone: json['phone'],
        imageUrl: ImageModel.fromJson(json['imageUrl']),
        gender: json['gender'],
        nat: json['nat'],
      );
}

class StreetModel extends StreetEntity {
  final String name;
  final String number;

  StreetModel({
    required this.name,
    required this.number,
  }) : super(
          name: name,
          number: number,
        );

  factory StreetModel.fromJson(Map<String, dynamic> json) =>
      StreetModel(name: json[''] ?? "", number: json[''] ?? "");
}

class ImageModel extends ImageEntity {
  final String large;
  final String medium;
  final String thumbnail;

  ImageModel({
    required this.large,
    required this.medium,
    required this.thumbnail,
  }) : super(
          large: large,
          medium: medium,
          thumbnail: thumbnail,
        );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      large: json[''] ?? "", medium: json[''] ?? "", thumbnail: json[''] ?? "");
}
