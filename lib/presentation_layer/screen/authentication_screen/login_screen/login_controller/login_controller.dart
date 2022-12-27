import 'package:get/get.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';

class LoginController extends GetxController {
  void gotoForgotPasswordRoute() {
    Get.toNamed(Routes.forgotPasswordRoute);
  }

  void gotoRegisterRoute() {
    Get.toNamed(Routes.registerRoute);
  }

  bool obsecuer = true;

  obSecuer() {
    obsecuer = !obsecuer;
    update();
  }
}
