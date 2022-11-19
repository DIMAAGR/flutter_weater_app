import 'package:get/get.dart';

/// Para funcionar o GetX é necessário de uma classe de controle
/// essa classe será um extend de [GetxController].
class GlobalController extends GetxController {
  //

  // As variáveis no Getx são definidas usando o Rx como prefixo de cada uma das
  // mesmas e, no final de cada declaração é utilizado o **.obs** para definir
  // que elas são do tipo observables.

  // ===========================================================================
  // Variables
  // ===========================================================================

  final RxBool _isLoading = false.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longetude = 0.0.obs;
}
