import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/core/helpers/helpers.dart';
import 'package:flutter_weater_app/src/core/theme/theme_data.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';

class HourlyWeatherButtonWidget extends StatelessWidget {
  //

  // ===========================================================================
  // Controllers & Variables
  // ===========================================================================
  final VoidCallback onTap;
  final int index;
  final bool isSelected;
  final WeatherModel model;

  const HourlyWeatherButtonWidget({super.key, required this.onTap, required this.index, required this.isSelected, required this.model});

  get _boxShadow {
    return BoxShadow(
      offset: const Offset(0.5, 0),
      blurRadius: 30,
      spreadRadius: 1,
      color: AppTheme.colors.dividerLine.withAlpha(150),
    );
  }

  // ===========================================================================
  // Build Method
  // ===========================================================================
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(left: 20, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [_boxShadow],
          gradient: isSelected ? LinearGradient(colors: [AppTheme.colors.firstGradientColor, AppTheme.colors.secondGradientColor]) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //

            // =================================================================
            // Day Hour Widget
            // =================================================================
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                Helpers.convertTimestampToHumanHour(model.hourly![index].dt!),
                style: TextStyle(color: isSelected ? Colors.white : AppTheme.colors.textColorBlack),
              ),
            ),

            // =================================================================
            // Hourly Status Image Widget
            // =================================================================
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(5),
              child: Image.asset('assets/weather/${model.hourly![index].weather![0].icon!}.png'),
            ),

            // =================================================================
            // Hourly temperature Widget
            // =================================================================
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                '${model.hourly![index].temp!.round()}°',
                style: TextStyle(color: isSelected ? Colors.white : AppTheme.colors.textColorBlack),
              ),
            )
          ],
        ),
      ),
    );
  }
}
