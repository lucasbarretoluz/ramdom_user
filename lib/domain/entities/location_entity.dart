import 'package:ramdom_user/domain/entities/street_entity.dart';

class LocationEntity {
  final String city;
  final String state;
  final String coutry;
  final StreetEntity street;

  const LocationEntity({
    required this.city,
    required this.state,
    required this.coutry,
    required this.street,
  });
}


