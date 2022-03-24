import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../weather/weather.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(theme: AppTheme.defaultTheme));

  void setTheme(Weather? weather) {
    if (weather != null) emit(weather.toThemeState(weather));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState(theme: json['theme'] as AppTheme);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'theme': state.theme};
  }
}

extension on Weather {
  toThemeState(Weather weather) {
    switch (condition) {
      case WeatherCondition.dayClear:
        return const ThemeState(theme: AppTheme.dayClear).themeChange;
      case WeatherCondition.nightClear:
        return const ThemeState(theme: AppTheme.nightCloudy).themeChange;
      case WeatherCondition.dayFewClouds:
        return const ThemeState(theme: AppTheme.dayCloudy).themeChange;
      case WeatherCondition.nightFewClouds:
        return const ThemeState(theme: AppTheme.nightCloudy).themeChange;
      case WeatherCondition.dayScatteredClouds:
        return const ThemeState(theme: AppTheme.dayCloudy).themeChange;
      case WeatherCondition.nightScatteredClouds:
        return const ThemeState(theme: AppTheme.nightCloudy).themeChange;
      case WeatherCondition.dayRain:
        return const ThemeState(theme: AppTheme.dayRain).themeChange;
      case WeatherCondition.nightRain:
        return const ThemeState(theme: AppTheme.nightRain).themeChange;
      case WeatherCondition.dayThunderstorm:
        return const ThemeState(theme: AppTheme.dayThunderstorm).themeChange;
      case WeatherCondition.nightThunderstorm:
        return const ThemeState(theme: AppTheme.nightThunderstorm).themeChange;
      case WeatherCondition.daySnow:
        return const ThemeState(theme: AppTheme.daySnow).themeChange;
      case WeatherCondition.nightSnow:
        return const ThemeState(theme: AppTheme.nightSnow).themeChange;
      default:
        return const ThemeState(theme: AppTheme.defaultTheme).themeChange;
    }
  }
}
