// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Temperature',
      json,
      ($checkedConvert) {
        final val = Temperature(
          $checkedConvert('value', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Weather',
      json,
      ($checkedConvert) {
        final val = Weather(
          city: $checkedConvert('city', (v) => v as String),
          lastUpdated: $checkedConvert(
              'last_updated', (v) => DateTime.parse(v as String)),
          condition: $checkedConvert(
              'condition', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          temperature: $checkedConvert('temperature',
              (v) => Temperature.fromJson(v as Map<String, dynamic>)),
          minTemperature: $checkedConvert('min_temperature',
              (v) => Temperature.fromJson(v as Map<String, dynamic>)),
          maxTemperature: $checkedConvert('max_temperature',
              (v) => Temperature.fromJson(v as Map<String, dynamic>)),
          humidity: $checkedConvert('humidity', (v) => (v as num).toDouble()),
          windSpeed:
              $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          windDegree: $checkedConvert('wind_degree', (v) => v as int),
          pressure: $checkedConvert('pressure', (v) => (v as num).toDouble()),
          sunrise: $checkedConvert('sunrise', (v) => (v as num).toDouble()),
          sunset: $checkedConvert('sunset', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'lastUpdated': 'last_updated',
        'minTemperature': 'min_temperature',
        'maxTemperature': 'max_temperature',
        'windSpeed': 'wind_speed',
        'windDegree': 'wind_degree'
      },
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'city': instance.city,
      'last_updated': instance.lastUpdated.toIso8601String(),
      'condition': _$WeatherConditionEnumMap[instance.condition],
      'temperature': instance.temperature.toJson(),
      'min_temperature': instance.minTemperature.toJson(),
      'max_temperature': instance.maxTemperature.toJson(),
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'wind_degree': instance.windDegree,
      'pressure': instance.pressure,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.dayClear: 'dayClear',
  WeatherCondition.nightClear: 'nightClear',
  WeatherCondition.dayFewClouds: 'dayFewClouds',
  WeatherCondition.nightFewClouds: 'nightFewClouds',
  WeatherCondition.dayScatteredClouds: 'dayScatteredClouds',
  WeatherCondition.nightScatteredClouds: 'nightScatteredClouds',
  WeatherCondition.dayRain: 'dayRain',
  WeatherCondition.nightRain: 'nightRain',
  WeatherCondition.dayThunderstorm: 'dayThunderstorm',
  WeatherCondition.nightThunderstorm: 'nightThunderstorm',
  WeatherCondition.daySnow: 'daySnow',
  WeatherCondition.nightSnow: 'nightSnow',
  WeatherCondition.unknown: 'unknown',
};
