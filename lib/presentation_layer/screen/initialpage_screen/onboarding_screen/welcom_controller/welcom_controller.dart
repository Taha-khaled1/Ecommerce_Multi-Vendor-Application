import 'package:get/get.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';

class WelcomeController extends GetxController {
  void gotoOnBoarding() {
    Get.toNamed(Routes.onBoardingRoute);
  }
}
