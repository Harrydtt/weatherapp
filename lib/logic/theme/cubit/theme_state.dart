part of 'theme_cubit.dart';

enum AppTheme {
  dayClear,
  nightClear,
  dayCloudy,
  nightCloudy,
  dayRain,
  nightRain,
  dayThunderstorm,
  nightThunderstorm,
  daySnow,
  nightSnow,
  defaultTheme,
}

final appThemeData = {
  AppTheme.dayClear: Image.asset('assets/theme_images/day_clear.png'),
  AppTheme.nightClear: Image.asset('assets/theme_images/night_clear.png'),
  AppTheme.dayCloudy: Image.asset('assets/theme_images/day_cloudy.png'),
  AppTheme.nightCloudy: Image.asset('assets/theme_images/night_cloudy.png'),
  AppTheme.dayRain: Image.asset('assets/theme_images/day_rain.png'),
  AppTheme.nightRain: Image.asset('assets/theme_images/night_rain.png'),
  AppTheme.dayThunderstorm:
      Image.asset('assets/theme_images/day_thuderstorm.png'),
  AppTheme.nightThunderstorm:
      Image.asset('assets/theme_images/night_thuderstorm.png'),
  AppTheme.daySnow: Image.asset('assets/theme_images/day_snow.png'),
  AppTheme.nightSnow: Image.asset('assets/theme_images/night_snow.png'),
  AppTheme.defaultTheme: Image.asset('assets/theme_images/default_theme.png'),
};

class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState({required this.theme});

  themeChange(theme) {
    return appThemeData[theme];
  }

  @override
  List<Object> get props => [theme];

  Map<String, dynamic> toMap(ThemeState state) {
    return {
      'theme': state.theme.toString(),
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    // if (map == null) return const ThemeState(theme: AppTheme.defaultTheme);
    return ThemeState(
      theme: AppTheme.values[map['theme']],
    );
  }
}
