import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/shope_res.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:quickalert/models/quickalert_type.dart';

class AddProductController extends GetxController {
  String? name;
  String? weight;
  String? height;
  String? width;
  String? photos;
  String? unit_price;
  String? description;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  StatusRequest statusRequest = StatusRequest.none;
  addPro({required BuildContext context}) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();

      var respon = await addProductRes(
        description: description!,
        height: height ?? '25',
        photos: photos ?? '556.3',
        unit_price: unit_price!,
        weight: weight!,
        width: width!,
        name: name!,
      );
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          Get.offAndToNamed(Routes.controlBoardRoute);
          showDilog(
            context,
            'تم اضافة المنتج بنجاح وبانتظار المراجعه',
          );
        } else {
          showDilog(
            context,
            'يوجد مشكله ما يرجي التواصل مع الدعم',
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
