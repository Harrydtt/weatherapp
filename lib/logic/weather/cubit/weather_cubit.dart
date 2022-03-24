import 'package:equatable/equatable.dart';
import 'package:weather_app/logic/weather/models/weather.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

part 'weather_state.dart';
part 'weather_cubit.g.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) {
      emit(state.copyWith(status: WeatherStatus.initial));
    }
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final weather = Weather.fromRepository(
          await _weatherRepository.fetchWeather(city: city.toString()));
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;
      emit(state.copyWith(
        status: WeatherStatus.success,
        weather: weather.copyWith(temperature: Temperature(value)),
        temperatureUnits: units,
      ));
    } catch (e) {
      emit(state);
    }
  }

  Future<void> refreshWeather() async {
    if (!state.status.isSuccess) {
      emit(state.copyWith(status: WeatherStatus.initial));
    }
    if (state.weather == Weather.empty) return;
    try {
      final weather = Weather.fromRepository(
          await _weatherRepository.fetchWeather(city: state.weather.city));
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;
      emit(state.copyWith(
        status: WeatherStatus.success,
        weather: weather.copyWith(temperature: Temperature(value)),
        temperatureUnits: units,
      ));
    } on Exception {
      emit(state);
    }
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) =>
      WeatherState.fromJson(json);

  @override
  Map<String, dynamic> toJson(WeatherState state) => state.toJson();

  void toggleUnits() {
    final units = state.temperatureUnits.isFahrenheit
        ? TemperatureUnits.celsius
        : TemperatureUnits.fahrenheit;

    final weather = state.weather;
    if (!state.status.isSuccess) {
      emit(state.copyWith(temperatureUnits: units));
      return;
    }

    if (weather != Weather.empty) {
      final temperature = weather.temperature;
      final value = units.isCelsius
          ? temperature.value.toCelsius()
          : temperature.value.toFahrenheit();
      emit(state.copyWith(
        status: WeatherStatus.success,
        weather: weather.copyWith(temperature: Temperature(value)),
        temperatureUnits: units,
      ));
    }
  }
}

extension on double {
  double toFahrenheit() => (this * 1.8) + 32;
  double toCelsius() => (this - 32) / 1.8;
}
