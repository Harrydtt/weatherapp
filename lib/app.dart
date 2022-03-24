import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/theme/theme.dart';
import 'package:weather_app/presentation/home/view/home_screen.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  final WeatherRepository _weatherRepository = WeatherRepository();

  WeatherApp({Key? key, required WeatherRepository weatherRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: const WeatherAppBody(),
      ),
    );
  }
}

class WeatherAppBody extends StatelessWidget {
  const WeatherAppBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, color) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Weather',
          home: const HomePage(),
        );
      },
    );
  }
}
