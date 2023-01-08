import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/shope_res.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:quickalert/models/quickalert_type.dart';

class SupportController extends GetxController {
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  late String name, message, email;
  StatusRequest statusRequest = StatusRequest.none;
  contactUs(BuildContext context) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();

      var respon = await contactUsRespon(name, message, email);
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          if (respon['success'].toString() == 'true') {
            showDilog(context, 'تم ارسال الرساله الخاصه بك\nبنجاح');
          } else {
            showDilog(
              context,
              'لم يتم ارسال الرساله',
              type: QuickAlertType.info,
            );
          }
        } else {
          showDilog(
            context,
            'يوجد مشكله ما',
            type: QuickAlertType.error,
          );
        }
      } catch (e) {
        print('catch $e');
        showDilog(
          context,
          'يوجد مشكله ما',
          type: QuickAlertType.error,
        );
      }
    }

    update();
  }
}
