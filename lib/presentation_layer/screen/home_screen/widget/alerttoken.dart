import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/login_screen/login_screen.dart';
import 'package:quickalert/quickalert.dart';

void aleartToken(BuildContext context) {
  QuickAlert.show(
    showCancelBtn: true,
    onCancelBtnTap: () {
      Get.back();
    },
    onConfirmBtnTap: () {
      Get.to(LoginScreen());
    },
    cancelBtnText: 'الرجوع للخلف',
    confirmBtnText: 'تسجيل الدخول',
    context: context,
    type: QuickAlertType.info,
    text: 'يجب تسجيل الدخول اولا',
  );
}
