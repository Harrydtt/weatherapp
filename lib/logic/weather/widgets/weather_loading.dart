import 'package:flutter/material.dart';
import 'package:weather_app/logic/text_themes/text_themes.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Weather Loading',
          style: AppTextStyle.header2,
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
