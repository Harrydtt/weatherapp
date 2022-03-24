part of 'settings_cubit.dart';

enum TemperatureUnits { celsius, fahrenheit }
enum SpeedUnits { mph, kph }
enum TimeFormat { twelveHour, twentyFourHour }

class UsersettingState extends Equatable {
  final TemperatureUnits temperatureUnit;
  final SpeedUnits speedUnit;
  final TimeFormat timeFormat;

  const UsersettingState(this.temperatureUnit, this.speedUnit, this.timeFormat);

  @override
  List<Object> get props => [temperatureUnit, speedUnit, timeFormat];

  UsersettingState copyWith(
      {TemperatureUnits? temperatureUnit,
      SpeedUnits? speedUnit,
      TimeFormat? timeFormat}) {
    return UsersettingState(
      temperatureUnit ?? this.temperatureUnit,
      speedUnit ?? this.speedUnit,
      timeFormat ?? this.timeFormat,
    );
  }
}
