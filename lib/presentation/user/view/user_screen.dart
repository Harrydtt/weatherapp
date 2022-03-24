import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/setting/settings_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:enum_to_string/enum_to_string.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: const Text('Settings'),
      ),
      body: BlocListener<SettingsCubit, UsersettingState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            duration: const Duration(milliseconds: 700),
            content: Text(
              'Temperature unit: ' +
                  state.temperatureUnit.toString().toUpperCase() +
                  ', Speed unit: ' +
                  state.speedUnit.toString().toUpperCase() +
                  ', Time format: ' +
                  state.timeFormat.toString().toUpperCase(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
        },
        child: BlocBuilder<SettingsCubit, UsersettingState>(
          builder: (context, state) {
            return Column(
              children: [
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: EnumToString.toList(TemperatureUnits.values),
                  onToggle: (index) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toggleTemperatureUnit(
                            TemperatureUnits.values[index!.toInt()]);
                  },
                ),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: EnumToString.toList(SpeedUnits.values),
                  onToggle: (index) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toggleSpeedUnit(SpeedUnits.values[index!.toInt()]);
                  },
                ),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: EnumToString.toList(TimeFormat.values),
                  onToggle: (index) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toggleTimeFormat(TimeFormat.values[index!.toInt()]);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
