import 'package:ramdom_user/domain/entities/street_entity.dart';
import 'package:ramdom_user/domain/entities/user_response_entity.dart';
import 'dart:convert';

import '../../domain/entities/image_entity.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/name_entity.dart';
import '../../domain/entities/user_entity.dart';

class UserResponseModel extends UserResponseEntity {
  const UserResponseModel({
    required this.users,
  }) : super(users: users);

  final List<UserModel> users;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        users: List<UserModel>.from(
            json['results'].map((x) => UserModel.fromJson(x))),
      );
}

class UserModel extends UserEntity {
  final NameEntity name;
  final LocationEntity location;
  final String email;
  final String phone;
  final ImageModel imageUrl;
  final String gender;
  final String nat;

  const UserModel({
    required this.name,
    required this.location,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
    required this.nat,
  }) : super(
          name: name,
          location: location,
          email: email,
          phone: phone,
          imageUrl: imageUrl,
          gender: gender,
          nat: nat,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: NameModel.fromJson(json['name']),
        email: json['email'] ?? "",
        phone: json['phone'] ?? "",
        imageUrl: ImageModel.fromJson(json['picture']),
        gender: json['gender'] ?? "",
        nat: json['nat'] ?? "",
        location: LocationModel.fromJson(json['location']),
      );
}

class NameModel extends NameEntity {
  final String title;
  final String first;
  final String last;

  NameModel({
    required this.title,
    required this.first,
    required this.last,
  }) : super(title: title, first: first, last: last);

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
    title: json['title'],
    first: json['first'],
    last: json['last'],
  );
}

class LocationModel extends LocationEntity {
  final String city;
  final String state;
  final String coutry;
  final StreetEntity street;

  LocationModel({
    required this.city,
    required this.state,
    required this.coutry,
    required this.street,
  }) : super(
          city: city,
          state: state,
          coutry: coutry,
          street: street,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
      city: json['city'],
      state: json['state'],
      coutry: json['country'],
      street: StreetModel.fromJson(json['street']));
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
      StreetModel(name: json['name'], number: json['number'].toString());
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
      large: json['large'] ?? "",
      medium: json['medium'] ?? "",
      thumbnail: json['thumbnail'] ?? "");
}
