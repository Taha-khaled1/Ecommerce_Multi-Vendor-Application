import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/auth_res.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/login_screen/login_screen.dart';
import 'package:quickalert/models/quickalert_type.dart';

class SignupController extends GetxController {
  bool obsecuer = true;
  String? email, password, name, phone;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  StatusRequest statusRequest = StatusRequest.none;
  register({required BuildContext context}) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();

      var respon = await RegisterResponse(
        email: email!,
        password: password!,
        phone: phone!,
        name: name!,
      );
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          showDilog(
            context,
            'تم انشاء الحساب بنجاح يمكنك الان تسجيل الدخول ',
            onConfirmBtnTap: () {
              Get.offAll(() => LoginScreen());
            },
          );
        } else {
          showDilog(
            context,
            'لم يتم انشاء الحساب',
            onConfirmBtnTap: () {},
            type: QuickAlertType.error,
          );
          statusRequest = StatusRequest.none;
        }
      } catch (e) {
        print('catch $e');
        showDilog(
          context,
          'يوجد مشكله ما',
          onConfirmBtnTap: () {},
          type: QuickAlertType.error,
        );
        statusRequest = StatusRequest.none;
      }
      update();
    }
  }

  obSecuer() {
    obsecuer = !obsecuer;
    update();
  }
}
