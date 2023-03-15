import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/auth_res.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/data_layer/function_resbon.dart/shope_res.dart';
import 'package:pisti/domain_layer/models/counters_models.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:quickalert/quickalert.dart';

class ControlBoardController extends GetxController {
  late String name, phone, address;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  CountersModels? countersModels;

  late StatusRequest statusRequest7;
  getAllCounters() async {
    try {
      statusRequest7 = StatusRequest.loading;
      var response = await getAllCountersRes(
        int.parse(
          sharedPreferences.getString('id').toString(),
        ),
      );

      statusRequest7 = handlingData(response);
      if (statusRequest7 == StatusRequest.success) {
        print('----------------------------------');
        countersModels = await CountersModels.fromJson(response);
      } else {
        statusRequest7 = StatusRequest.failure;
        print('----------------failure------------------');
      }
    } catch (e) {
      statusRequest7 = StatusRequest.erorr;
      print('--------------erorr--------------------');
    }
    update();
  }

  StatusRequest statusRequest1 = StatusRequest.none;
  logOut(BuildContext context) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var respon = await LogOutRes();
    statusRequest1 = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest1) {
        statusRequest1 = StatusRequest.none;
        await sharedPreferences.remove('access_token');

        //   Get.offAll(() => MyHomePage(title: 'title'));
        showDilog(context, 'تم تسجيل الخروج بنجاح');
      } else {
        statusRequest1 = StatusRequest.serverfailure;
      }
    } catch (e) {
      statusRequest1 = StatusRequest.erorr;
    }

    update();
  }

  StatusRequest statusRequest = StatusRequest.none;
  requestShope(BuildContext context) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();

      var respon = await shopeRequestRespon(name, phone, address);
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          if (respon['success'].toString() == 'true') {
            showDilog(context, 'تم طلب فتح المتجر الخاص بك');
          } else {
            showDilog(
              context,
              'انت بالفعل مسجل المتجر الخاص بك',
              type: QuickAlertType.info,
            );
          }
        } else {
          showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
        }
      } catch (e) {
        print('catch $e');
        showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
      }
    }

    update();
  }

  final GlobalKey<FormState> formkeysigin4 = GlobalKey();
  String? namee, phonee, addresse, fac;
  StatusRequest statusRequest3 = StatusRequest.none;
  editeShope(BuildContext context) async {
    if (formkeysigin4.currentState!.validate()) {
      formkeysigin4.currentState!.save();
      statusRequest3 = StatusRequest.loading;
      update();

      var respon = await editeShopeRespon(
          namee!, phonee!, addresse!, fac ?? 'facebok.com');
      statusRequest3 = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest3) {
          if (respon['success'].toString() == 'true') {
            showDilog(context, 'تم تحديث معلومات المتجر الخاص بك');
          } else {
            showDilog(
              context,
              'لم يتم التحديث بسبب مشكله ما يرجي التواصل مع الدعم',
              type: QuickAlertType.info,
            );
          }
        } else {
          showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
        }
      } catch (e) {
        print('catch $e');
        showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
      }
    }

    update();
  }

  late bool x;
  @override
  void onInit() {
    if (sharedPreferences.getString('type') == 'seller') {
      x = true;
    } else {
      x = false;
    }
    getAllCounters();
    super.onInit();
  }
}
