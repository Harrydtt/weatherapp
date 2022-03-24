import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:weather_api/weather_api.dart';

class LocationRequestFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class WeatherApiClient {
  final http.Client _cilent = http.Client();

  static const apiKey = '189df97f5958253ef6c38a94537fa094';

  static const _baseUrl = 'https://api.openweathermap.org';

  Future<Location> searchCities({required String query}) async {
    const limit = 6;
    final url = '$_baseUrl/geo/1.0/direct?q=$query&limit=$limit&appid=$apiKey';
    final response = await _cilent.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Location.fromJson(json.first as Map<String, dynamic>);
    } else {
      throw LocationRequestFailure();
    }
  }

  Future<Weather> getWeather({required String city}) async {
    final url =
        '$_baseUrl/data/2.5/weather?lat=$city&units=metric&appid=$apiKey';
    final response = await _cilent.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.isEmpty) {
        throw WeatherNotFoundFailure();
      }
      return Weather.fromJson(json as Map<String, dynamic>);
    } else {
      throw WeatherRequestFailure();
    }
  }
}
