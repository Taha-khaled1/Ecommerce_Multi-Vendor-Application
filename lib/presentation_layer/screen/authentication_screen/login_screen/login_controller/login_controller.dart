import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/login_res.dart';
import 'package:pisti/main.dart';
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

  final GlobalKey<FormState> formkeysigin = GlobalKey();
  late String emaillog, passwordlog;
  StatusRequest statusRequest = StatusRequest.none;
  login() async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();
      var respon = await loginRes(emaillog, passwordlog);
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          if (respon['result'].toString() == 'true') {
            sharedPreferences.setString('id', respon['user']['id'].toString());
            sharedPreferences.setString(
                'name', respon['user']['name'].toString());
            sharedPreferences.setString(
                'avatar', respon['user']['avatar'].toString());
            sharedPreferences.setString(
                'email', respon['user']['email'].toString());
            sharedPreferences.setString(
                'phone', respon['user']['phone'].toString());
            sharedPreferences.setString(
                'access_token', respon['access_token'].toString());
            sharedPreferences.setString('step', '2');
            Get.toNamed(Routes.homeRoute);
            print('Sucss $respon');
          } else {
            statusRequest = StatusRequest.none;
            print('erorr $respon');
            customSnackBar(respon['message']);
          }
        } else {
          customSnackBar('الحساب غير موجود');
        }
      } catch (e) {
        print('catch $e');
        customSnackBar(respon['message']);
      }
      update();
    }
  }
}

void customSnackBar(String massg) {
  Get.snackbar(
    "الحاله",
    massg,
    icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.TOP,
  );
}
