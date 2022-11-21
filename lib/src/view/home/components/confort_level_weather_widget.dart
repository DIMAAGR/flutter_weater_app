import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/core/theme/theme_data.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeConfortLevelWeatherWidget extends StatelessWidget {
  //

  // ===========================================================================
  // Controllers & Variables
  // ===========================================================================
  final WeatherModel model;

  const HomeConfortLevelWeatherWidget({super.key, required this.model});

  // ===========================================================================
  // Confort level Title Widget
  // ===========================================================================
  Container _confortLevelTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
      child: const Text('Nível de Conforto', style: TextStyle(fontSize: 18)),
    );
  }

  // ===========================================================================
  // Humidity level Widget
  // ===========================================================================
  SizedBox _humidityCircularSliderWidget() {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          Center(
            child: SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: model.current!.humidity!.toDouble(),
              appearance: CircularSliderAppearance(
                customWidths: CustomSliderWidths(handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                infoProperties: InfoProperties(
                  bottomLabelText: 'Humidade',
                  bottomLabelStyle: const TextStyle(letterSpacing: 0.1, fontSize: 14, height: 1.5),
                ),
                animationEnabled: true,
                size: 140,
                customColors: CustomSliderColors(
                  hideShadow: true,
                  trackColor: AppTheme.colors.firstGradientColor.withAlpha(100),
                  progressBarColors: [
                    AppTheme.colors.firstGradientColor,
                    AppTheme.colors.secondGradientColor,
                  ],
                ),
              ),
            ),
          ),

          // ===================================================================
          // Feels Like Widget
          // ===================================================================
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sensação termica ${model.current!.feelsLike!.round()}°', style: AppTheme.textStyles.feelsLike),
              Container(height: 25, margin: const EdgeInsets.symmetric(horizontal: 40), width: 1, color: AppTheme.colors.dividerLine),
              Text('Índice UV ${model.current!.uvi!.round()}', style: AppTheme.textStyles.feelsLike),
            ],
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // Build Method
  // ===========================================================================
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //

        // =====================================================================
        // Confort level Title Widget
        // =====================================================================
        _confortLevelTitle(),

        // =====================================================================
        // Humidity level Widget
        // =====================================================================
        _humidityCircularSliderWidget(),
      ],
    );
  }
}
