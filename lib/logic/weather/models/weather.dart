import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

part 'weather.g.dart';

enum TemperatureUnits {
  celsius,
  fahrenheit,
}

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

@JsonSerializable()
class Temperature extends Equatable {
  final double value;

  const Temperature(this.value);

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  @override
  List<Object> get props => [value];
}

@JsonSerializable()
class Weather extends Equatable {
  final String city;
  final DateTime lastUpdated;
  final WeatherCondition condition;
  final Temperature temperature;
  final Temperature minTemperature;
  final Temperature maxTemperature;
  final double humidity;
  final double windSpeed;
  final int windDegree;
  final double pressure;
  final double sunrise;
  final double sunset;

  const Weather({
    required this.city,
    required this.lastUpdated,
    required this.condition,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.windSpeed,
    required this.windDegree,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      city: weather.city,
      lastUpdated: DateTime.now(),
      condition: weather.icon,
      temperature: Temperature(weather.temperature),
      minTemperature: Temperature(weather.temperatureMin),
      maxTemperature: Temperature(weather.temperatureMax),
      humidity: weather.humidity,
      windSpeed: weather.windSpeed,
      windDegree: weather.windDegree.toInt(),
      pressure: weather.pressure,
      sunrise: weather.sunrise,
      sunset: weather.sunset,
    );
  }

  static final empty = Weather(
    city: "---",
    condition: WeatherCondition.unknown,
    lastUpdated: DateTime.now(),
    temperature: const Temperature(0),
    minTemperature: const Temperature(0),
    maxTemperature: const Temperature(0),
    humidity: 0,
    windSpeed: 0,
    windDegree: 0,
    pressure: 0,
    sunrise: 0,
    sunset: 0,
  );

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props => [
        city,
        lastUpdated,
        condition,
        temperature,
        minTemperature,
        maxTemperature,
        humidity,
        windSpeed,
        windDegree,
        pressure,
        sunrise,
        sunset,
      ];

  Weather copyWith({
    String? city,
    DateTime? lastUpdated,
    WeatherCondition? condition,
    Temperature? temperature,
    Temperature? minTemperature,
    Temperature? maxTemperature,
    double? humidity,
    double? windSpeed,
    int? windDegree,
    double? pressure,
    double? sunrise,
    double? sunset,
  }) {
    return Weather(
      city: city ?? this.city,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      condition: condition ?? this.condition,
      temperature: temperature ?? this.temperature,
      minTemperature: minTemperature ?? this.minTemperature,
      maxTemperature: maxTemperature ?? this.maxTemperature,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      windDegree: windDegree ?? this.windDegree,
      pressure: pressure ?? this.pressure,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}
