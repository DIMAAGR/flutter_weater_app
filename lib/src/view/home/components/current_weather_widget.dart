import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/core/theme/theme_data.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';

class HomeCurrentWeatherWidget extends StatelessWidget {
  //

  // ===========================================================================
  // Controllers & Variables
  // ===========================================================================
  final WeatherModel model;

  const HomeCurrentWeatherWidget({super.key, required this.model});

  // ===========================================================================
  // Temperature Widget
  // ===========================================================================
  Widget _showTemperatureWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/weather/${model.current!.weather![0].icon!}.png', width: 80, height: 80),
        Container(height: 50, width: 1, color: AppTheme.colors.dividerLine),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: '${model.current!.temp!.round()}°', style: AppTheme.textStyles.temperature),
              TextSpan(text: '${model.current!.weather![0].description}', style: AppTheme.textStyles.description),
            ],
          ),
        )
      ],
    );
  }

  // ===========================================================================
  // More Details Widget
  // ===========================================================================
  Widget _detailsBlocWidget({String? imageAsset}) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppTheme.colors.cardColor),
      child: imageAsset == null ? const SizedBox() : Image.asset(imageAsset),
    );
  }

  // ===========================================================================
  // More Details Widget
  // ===========================================================================
  Widget _showModeDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _detailsBlocWidget(imageAsset: 'assets/icons/windspeed.png'),
            _detailsBlocWidget(imageAsset: 'assets/icons/clouds.png'),
            _detailsBlocWidget(imageAsset: 'assets/icons/humidity.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 20, width: 60, child: Text('${model.current!.windSpeed}Km/h', textAlign: TextAlign.center, style: AppTheme.textStyles.descritpionSubtitle)),
            SizedBox(height: 20, width: 60, child: Text('${model.current!.clouds}%', textAlign: TextAlign.center, style: AppTheme.textStyles.descritpionSubtitle)),
            SizedBox(height: 20, width: 60, child: Text('${model.current!.humidity}%', textAlign: TextAlign.center, style: AppTheme.textStyles.descritpionSubtitle)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // =========================================================================
        // Temperature Widget
        // =========================================================================
        _showTemperatureWidget(),
        const SizedBox(height: 16),

        // =========================================================================
        // More details (windspeed, humidity, clouds) - Widget
        // =========================================================================
        _showModeDetailsWidget()
      ],
    );
  }
}

/*
 Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/weather/${model.current!.weather![0].icon!}.png'))),
    );
 */
