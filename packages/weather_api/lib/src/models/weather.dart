// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class Weather {
  Weather(
    this.icon,
    this.city,
    this.temperature,
    this.temp_max,
    this.temp_min,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windDirection,
    this.sunrise,
    this.sunset,
    this.description,
    this.timezone,
    this.date,
  );

  WeatherIcon icon;
  String city;
  double temperature;
  double temp_min;
  double temp_max;
  double humidity;
  double pressure;
  double windSpeed;
  double windDirection;
  int sunrise;
  int sunset;
  String description;
  String timezone;
  String date;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

enum WeatherIcon {
  @JsonValue('01d')
  day_clear,
  @JsonValue('01n')
  night_clear,
  @JsonValue('02d')
  day_few_clouds,
  @JsonValue('02n')
  night_few_clouds,
  @JsonValue('03d')
  day_scattered_clouds,
  @JsonValue('03n')
  night_scattered_clouds,
  @JsonValue('04d')
  day_broken_clouds,
  @JsonValue('04n')
  night_broken_clouds,
  @JsonValue('09d')
  day_shower_rain,
  @JsonValue('09n')
  night_shower_rain,
  @JsonValue('10d')
  day_rain,
  @JsonValue('10n')
  night_rain,
  @JsonValue('11d')
  day_thunderstorm,
  @JsonValue('11n')
  night_thunderstorm,
  @JsonValue('13d')
  day_snow,
  @JsonValue('13n')
  night_snow,
  @JsonValue('50d')
  day_mist,
  @JsonValue('50n')
  night_mist,
  unknown
}
