import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  String name;
  double lat;
  double lon;
  String country;
  String state;

  Location({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  String toCitiesList() {
    return '{$name, $country, $state}';
  }
}
