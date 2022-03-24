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
          $checkedConvert('icon', (v) => $enumDecode(_$WeatherIconEnumMap, v)),
          $checkedConvert('city', (v) => v as String),
          $checkedConvert('temperature', (v) => (v as num).toDouble()),
          $checkedConvert('temp_max', (v) => (v as num).toDouble()),
          $checkedConvert('temp_min', (v) => (v as num).toDouble()),
          $checkedConvert('humidity', (v) => (v as num).toDouble()),
          $checkedConvert('pressure', (v) => (v as num).toDouble()),
          $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          $checkedConvert('wind_direction', (v) => (v as num).toDouble()),
          $checkedConvert('sunrise', (v) => v as int),
          $checkedConvert('sunset', (v) => v as int),
          $checkedConvert('description', (v) => v as String),
          $checkedConvert('timezone', (v) => v as String),
          $checkedConvert('date', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'windSpeed': 'wind_speed',
        'windDirection': 'wind_direction'
      },
    );

const _$WeatherIconEnumMap = {
  WeatherIcon.day_clear: '01d',
  WeatherIcon.night_clear: '01n',
  WeatherIcon.day_few_clouds: '02d',
  WeatherIcon.night_few_clouds: '02n',
  WeatherIcon.day_scattered_clouds: '03d',
  WeatherIcon.night_scattered_clouds: '03n',
  WeatherIcon.day_broken_clouds: '04d',
  WeatherIcon.night_broken_clouds: '04n',
  WeatherIcon.day_shower_rain: '09d',
  WeatherIcon.night_shower_rain: '09n',
  WeatherIcon.day_rain: '10d',
  WeatherIcon.night_rain: '10n',
  WeatherIcon.day_thunderstorm: '11d',
  WeatherIcon.night_thunderstorm: '11n',
  WeatherIcon.day_snow: '13d',
  WeatherIcon.night_snow: '13n',
  WeatherIcon.day_mist: '50d',
  WeatherIcon.night_mist: '50n',
  WeatherIcon.unknown: 'unknown',
};
