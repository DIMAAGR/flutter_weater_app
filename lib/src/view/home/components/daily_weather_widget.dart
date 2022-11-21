import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/core/helpers/helpers.dart';
import 'package:flutter_weater_app/src/core/theme/theme_data.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';

class HomeViewDailyWeatherWidget extends StatelessWidget {
  //

  // ===========================================================================
  // Controllers & Variables
  // ===========================================================================
  final WeatherModel model;

  const HomeViewDailyWeatherWidget({super.key, required this.model});

  // ===========================================================================
  // Next Days Widget
  // ===========================================================================
  _nextDaysWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.topLeft,
      child: Text('Próximos dias', style: AppTheme.textStyles.nextDays),
    );
  }

  // ===========================================================================
  // Daily List Widget
  // ===========================================================================
  _dailyListWidget() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: model.daily!.length > 7 ? 7 : model.daily!.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //

                  // ===========================================================
                  // Week Days Widget
                  // ===========================================================
                  SizedBox(
                    width: 80,
                    child: Text(Helpers.convertTimestampToHumanDate(model.daily![index].dt!), style: AppTheme.textStyles.week),
                  ),

                  // ===========================================================
                  // Day Status Image Widget
                  // ===========================================================
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/weather/${model.daily![index].weather![0].icon!}.png'),
                  ),

                  // ===========================================================
                  // Maximum/Minimum Temperature Widget
                  // ===========================================================
                  Text('${model.daily![index].temp!.max!.round()}°/${model.daily![index].temp!.min!.round()}°'),
                ],
              ),
            ),
            Container(height: 1, color: AppTheme.colors.dividerLine),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // Build Method
  // ===========================================================================
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.colors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          //

          // =====================================================================
          // Next Days Widget
          // =====================================================================
          _nextDaysWidget(),

          // =====================================================================
          // Daily List Widget
          // =====================================================================
          _dailyListWidget(),
        ],
      ),
    );
  }
}
