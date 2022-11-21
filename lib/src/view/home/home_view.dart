import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/controllers/global_controller.dart';
import 'package:flutter_weater_app/src/core/theme/theme_data.dart';
import 'package:flutter_weater_app/src/view/home/components/confort_level_weather_widget.dart';
import 'package:flutter_weater_app/src/view/home/components/current_weather_widget.dart';
import 'package:flutter_weater_app/src/view/home/components/daily_weather_widget.dart';
import 'package:flutter_weater_app/src/view/home/components/header_widget.dart';
import 'package:flutter_weater_app/src/view/home/components/hourly_weather_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //

  // ===========================================================================
  // Controllers & Variables
  // ===========================================================================
  GlobalController controller = Get.put(GlobalController(), permanent: true);

  // ===========================================================================
  // Loading  Widget
  // ===========================================================================
  Widget _loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/icons/clouds.png'))),
            child: Container(
              padding: const EdgeInsets.all(86),
              child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
            ),
          ),
          const SizedBox(height: 8),
          Text('Aguarde... Carregando dados...', style: AppTheme.textStyles.loading),
        ],
      ),
    );
  }

  // ===========================================================================
  // Build Method
  // ===========================================================================

  // Para funcionar o GetX é necessário que no método build seja utilizado o
  // widget **Obx**.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => controller.checkIsLoading().isTrue
            ? _loadingWidget()
            : RefreshIndicator(
                onRefresh: () async => await controller.getLocation(),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 20),
                    const HomeHeaderWidget(),
                    HomeCurrentWeatherWidget(model: controller.getWeatherModel().value),
                    const SizedBox(height: 20),
                    HomeHourlyWeatherWidget(model: controller.getWeatherModel().value),
                    HomeViewDailyWeatherWidget(model: controller.getWeatherModel().value),
                    HomeConfortLevelWeatherWidget(model: controller.getWeatherModel().value)
                  ],
                ),
              ),
      ),
    ));
  }
}
