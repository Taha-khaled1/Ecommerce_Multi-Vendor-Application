import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/auth_res.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:quickalert/models/quickalert_type.dart';

class ForgotPasswordController extends GetxController {
  String? email;
  final GlobalKey<FormState> formkeysigin = GlobalKey();

  StatusRequest statusRequest = StatusRequest.none;
  forgetPass({required BuildContext context}) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();

      var respon = await forgetPassResponse(
        email!,
      );
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          showDilog(
            context,
            ' تم ارسال الكود بنجاح يمكنك الان اعادو كتابة الباسورد',
            onConfirmBtnTap: () {
              Get.toNamed(Routes.resetPasswordRoute);
            },
          );
        } else {
          showDilog(
            context,
            'لم يتم  ارسال الكود',
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
