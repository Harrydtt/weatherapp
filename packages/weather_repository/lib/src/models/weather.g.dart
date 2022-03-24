// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Weather',
      json,
      ($checkedConvert) {
        final val = Weather(
          city: $checkedConvert('city', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          icon: $checkedConvert(
              'icon', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          temperature:
              $checkedConvert('temperature', (v) => (v as num).toDouble()),
          temperatureMin:
              $checkedConvert('temperature_min', (v) => (v as num).toDouble()),
          temperatureMax:
              $checkedConvert('temperature_max', (v) => (v as num).toDouble()),
          pressure: $checkedConvert('pressure', (v) => (v as num).toDouble()),
          humidity: $checkedConvert('humidity', (v) => (v as num).toDouble()),
          windSpeed:
              $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          windDegree:
              $checkedConvert('wind_degree', (v) => (v as num).toDouble()),
          sunrise: $checkedConvert('sunrise', (v) => (v as num).toDouble()),
          sunset: $checkedConvert('sunset', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperatureMin': 'temperature_min',
        'temperatureMax': 'temperature_max',
        'windSpeed': 'wind_speed',
        'windDegree': 'wind_degree'
      },
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'city': instance.city,
      'description': instance.description,
      'icon': _$WeatherConditionEnumMap[instance.icon],
      'temperature': instance.temperature,
      'temperature_min': instance.temperatureMin,
      'temperature_max': instance.temperatureMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'wind_degree': instance.windDegree,
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
