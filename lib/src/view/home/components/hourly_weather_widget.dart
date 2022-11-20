import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/controllers/global_controller.dart';
import 'package:flutter_weater_app/src/core/helpers/helpers.dart';
import 'package:flutter_weater_app/src/core/theme/theme_data.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';
import 'package:get/get.dart';

class HomeHourlyWeatherWidget extends StatelessWidget {
  //

  // ===========================================================================
  // Controllers & Variables
  // ===========================================================================
  final WeatherModel model;
  final RxInt index = GlobalController().getIndex();

  HomeHourlyWeatherWidget({super.key, required this.model});

  // ===========================================================================
  // Today Title Widet
  // ===========================================================================
  Widget _todayTitleWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: Alignment.topCenter,
      child: const Text('Hoje', style: TextStyle(fontSize: 18)),
    );
  }

  // ===========================================================================
  // Hourly List Widet
  // ===========================================================================

  // Para funcionar o GetX é necessário que no método build seja utilizado o
  // widget **Obx**.
  Widget _hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.hourly!.length > 12 ? 12 : model.hourly!.length,
        itemBuilder: (_, index) => Obx(
          () => GestureDetector(
            onTap: () => this.index.value = index,
            child: Container(
              width: 90,
              margin: const EdgeInsets.only(left: 20, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.5, 0),
                    blurRadius: 30,
                    spreadRadius: 1,
                    color: AppTheme.colors.dividerLine.withAlpha(150),
                  )
                ],
                gradient: this.index.value == index
                    ? LinearGradient(colors: [
                        AppTheme.colors.firstGradientColor,
                        AppTheme.colors.secondGradientColor,
                      ])
                    : null,
              ),
              child: _hourlyDetails(index: index),
            ),
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // Hourly Details Widet
  // ===========================================================================
  Widget _hourlyDetails({required int index}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            Helpers.convertTimestampToHumanDate(model.hourly![index].dt!),
            style: TextStyle(color: this.index.value == index ? Colors.white : AppTheme.colors.textColorBlack),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.all(5),
          child: Image.asset('assets/weather/${model.hourly![index].weather![0].icon!}.png'),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            '${model.hourly![index].temp!.round()}°',
            style: TextStyle(color: this.index.value == index ? Colors.white : AppTheme.colors.textColorBlack),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //

        // ===========================================================================
        // Today Title Widet
        // ===========================================================================
        _todayTitleWidget(),

        // ===========================================================================
        // Hourly List Widet
        // ===========================================================================
        _hourlyList(),
      ],
    );
  }
}
