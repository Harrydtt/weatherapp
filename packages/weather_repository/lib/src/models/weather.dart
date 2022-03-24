import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final String city;
  final String description;
  final WeatherCondition icon;
  final double temperature;
  final double temperatureMin;
  final double temperatureMax;
  final double pressure;
  final double humidity;
  final double windSpeed;
  final double windDegree;
  final double sunrise;
  final double sunset;

  const Weather(
      {required this.city,
      required this.description,
      required this.icon,
      required this.temperature,
      required this.temperatureMin,
      required this.temperatureMax,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.windDegree,
      required this.sunrise,
      required this.sunset});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props => [
        city,
        description,
        icon,
        temperature,
        temperatureMin,
        temperatureMax,
        pressure,
        humidity,
        windSpeed,
        windDegree,
        sunrise,
        sunset
      ];
}

enum WeatherCondition {
  dayClear,
  nightClear,
  dayFewClouds,
  nightFewClouds,
  dayScatteredClouds,
  nightScatteredClouds,
  dayRain,
  nightRain,
  dayThunderstorm,
  nightThunderstorm,
  daySnow,
  nightSnow,
  unknown
}
