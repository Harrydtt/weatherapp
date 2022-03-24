import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/theme/theme.dart';
import 'package:weather_app/logic/weather/weather.dart';
import 'package:weather_app/logic/weather/widgets/weather_error.dart';
import 'package:weather_app/logic/weather/widgets/weather_initial.dart';
import 'package:weather_app/logic/weather/widgets/weather_loading.dart';
import 'package:weather_app/logic/weather/widgets/weather_populated.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<ThemeCubit>().setTheme(state.weather);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case WeatherStatus.initial:
                return const WeatherInitial();
              case WeatherStatus.loading:
                return const WeatherLoading();
              case WeatherStatus.success:
                return const WeatherSuccess();
              case WeatherStatus.failure:
                return const WeatherError();
              default:
                return const Center(child: Text('Unknown'));
            }
          },
        ),
      )),
    );
  }
}
