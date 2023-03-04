import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/auth_res.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:quickalert/quickalert.dart';

class ResetPasswordController extends GetxController {
  String? pass, code;
  final GlobalKey<FormState> formkeysigin = GlobalKey();

  StatusRequest statusRequest = StatusRequest.none;
  resetPass({required BuildContext context}) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();

      var respon = await resetPassResponse(
        code,
        pass!,
      );
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          if (respon['result'] == 'true') {
            showDilog(
              context,
              'تم تغير كلمة السر بنجاح يمكنك الان تسجيل الدخول',
              onConfirmBtnTap: () {
                Get.toNamed(Routes.loginRoute);
              },
            );
          } else {
            showDilog(
              context,
              'الكود خاطئ',
              type: QuickAlertType.error,
              onConfirmBtnTap: () {},
            );
          }
        } else {
          showDilog(
            context,
            'لم يتم  تغير كلمة السر يرجي التواصل مع الدعم',
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
}
