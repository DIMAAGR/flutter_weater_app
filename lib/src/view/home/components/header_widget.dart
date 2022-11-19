import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/controllers/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  //

  // ===========================================================================
  // Controllers & Variables
  // ===========================================================================
  GlobalController controller = Get.put(GlobalController(), permanent: true);
  String city = '';
  String date = DateFormat('yMMMd').format(DateTime.now()).toString();

  // ===========================================================================
  // Lifecycle
  // ===========================================================================
  @override
  void initState() {
    super.initState();
    getAddress(
      controller.getLatitude().value,
      controller.getLongitude().value,
    );
  }

  // ===========================================================================
  // method: getAddress
  // ===========================================================================
  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    Placemark place = placemark[0];
    setState(() => city = place.subAdministrativeArea!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(city, style: const TextStyle(fontSize: 35, height: 2)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(date, style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w300, height: 1.5)),
        ),
      ],
    );
  }
}
