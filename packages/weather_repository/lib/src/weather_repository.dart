import 'dart:async';
import 'package:weather_api/weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherFailure implements Exception {}

class WeatherRepository {
  final WeatherApiClient _weatherApiClient;

  WeatherRepository({WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  Future<String> getCities({required String query}) async {
    if (query.isEmpty) {
      return '';
    }
    final cities = await _weatherApiClient.searchCities(query: query);
    //return a List of cities
    return cities.toCitiesList();
  }

  Future<Weather> fetchWeather({required String city}) async {
    try {
      final weather = await _weatherApiClient.getWeather(city: city);
      return Weather(
        city: weather.city,
        temperature: weather.temperature,
        description: weather.description,
        icon: weather.icon.toCondition(),
        temperatureMax: weather.temp_max,
        temperatureMin: weather.temp_min,
        pressure: weather.pressure,
        humidity: weather.humidity,
        windSpeed: weather.windSpeed,
        windDegree: weather.windDirection,
        sunrise: weather.sunrise.toDouble(),
        sunset: weather.sunset.toDouble(),
      );
    } on Exception {
      throw WeatherFailure();
    }
  }
}

extension on WeatherIcon {
  WeatherCondition toCondition() {
    switch (this) {
      case WeatherIcon.day_clear:
        return WeatherCondition.dayClear;
      case WeatherIcon.night_clear:
        return WeatherCondition.nightClear;
      case WeatherIcon.day_few_clouds:
        return WeatherCondition.dayFewClouds;
      case WeatherIcon.night_few_clouds:
        return WeatherCondition.nightFewClouds;
      case WeatherIcon.day_scattered_clouds:
        return WeatherCondition.dayScatteredClouds;
      case WeatherIcon.night_scattered_clouds:
        return WeatherCondition.nightScatteredClouds;
      case WeatherIcon.day_broken_clouds:
        return WeatherCondition.dayScatteredClouds;
      case WeatherIcon.night_broken_clouds:
        return WeatherCondition.nightScatteredClouds;
      case WeatherIcon.day_shower_rain:
        return WeatherCondition.dayRain;
      case WeatherIcon.night_shower_rain:
        return WeatherCondition.nightRain;
      case WeatherIcon.day_rain:
        return WeatherCondition.dayRain;
      case WeatherIcon.night_rain:
        return WeatherCondition.nightRain;
      case WeatherIcon.day_thunderstorm:
        return WeatherCondition.dayThunderstorm;
      case WeatherIcon.night_thunderstorm:
        return WeatherCondition.dayThunderstorm;
      case WeatherIcon.day_snow:
      case WeatherIcon.day_mist:
        return WeatherCondition.daySnow;
      case WeatherIcon.night_snow:
      case WeatherIcon.night_mist:
        return WeatherCondition.nightSnow;
      default:
        return WeatherCondition.unknown;
    }
  }
}
