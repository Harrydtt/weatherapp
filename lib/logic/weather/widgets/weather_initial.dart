import 'package:flutter/material.dart';
import 'package:weather_app/logic/text_themes/text_themes.dart';

class WeatherInitial extends StatelessWidget {
  const WeatherInitial({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Weather Initial',
          style: AppTextStyle.header2,
        ),
        SizedBox(height: 8),
        Text(
          'Find out the weather in your city',
          style: AppTextStyle.explainText,
        ),
      ],
    );
  }
}
