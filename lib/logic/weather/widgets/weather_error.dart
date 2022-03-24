import 'package:flutter/material.dart';
import 'package:weather_app/logic/text_themes/text_themes.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Weather Error',
          style: AppTextStyle.header2,
        ),
        SizedBox(height: 8),
        Text(
          'Search error',
          style: AppTextStyle.explainText,
        ),
      ],
    );
  }
}
