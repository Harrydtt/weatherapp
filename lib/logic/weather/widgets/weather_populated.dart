import 'package:flutter/material.dart';
import 'package:weather_app/logic/text_themes/text_themes.dart';

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Weather Success',
          style: AppTextStyle.header2,
        ),
        SizedBox(height: 8),
        Text(
          'OK roi do',
          style: AppTextStyle.explainText,
        ),
      ],
    );
  }
}
