import 'package:get/get.dart';

class EditProfileController extends GetxController {
  String pay = 'اختار طريقة دفع';
  changepay(String x) {
    pay = x;
    update();
    Get.back();
  }
}
