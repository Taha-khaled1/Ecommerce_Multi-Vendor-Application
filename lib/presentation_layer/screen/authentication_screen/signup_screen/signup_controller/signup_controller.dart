import 'package:get/get.dart';

class SignupController extends GetxController {
  bool obsecuer = true;

  obSecuer() {
    obsecuer = !obsecuer;
    update();
  }
}
