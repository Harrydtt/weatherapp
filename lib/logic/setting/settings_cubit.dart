import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<UsersettingState> {
  SettingsCubit()
      : super(const UsersettingState(
            TemperatureUnits.celsius, SpeedUnits.kph, TimeFormat.twelveHour));

  void toggleTemperatureUnit(TemperatureUnits unit) {
    emit(state.copyWith(temperatureUnit: unit));
  }

  void toggleSpeedUnit(SpeedUnits unit) {
    emit(state.copyWith(speedUnit: unit));
  }

  void toggleTimeFormat(TimeFormat format) {
    emit(state.copyWith(timeFormat: format));
  }
}
