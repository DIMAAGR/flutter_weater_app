import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/controllers/global_controller.dart';
import 'package:flutter_weater_app/src/core/theme/theme_data.dart';
import 'package:flutter_weater_app/src/view/home/components/header_widget.dart';
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
        children: [
          const CircularProgressIndicator(color: Colors.grey, strokeWidth: 5),
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
            : ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  SizedBox(height: 20),
                  HomeHeaderWidget(),
                ],
              ),
      ),
    ));
  }
}
