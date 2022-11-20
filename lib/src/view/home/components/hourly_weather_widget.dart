import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/controllers/global_controller.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';
import 'package:flutter_weater_app/src/view/home/components/hourly_weather_button.dart';
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
          () => HourlyWeatherButtonWidget(
            onTap: () => this.index.value = index,
            isSelected: this.index.value == index,
            model: model,
            index: index,
          ),
        ),
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
