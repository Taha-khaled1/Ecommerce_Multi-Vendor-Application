import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/data_layer/function_resbon.dart/shope_res.dart';
import 'package:pisti/domain_layer/models/counters_models.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:quickalert/quickalert.dart';

class ControlBoardController extends GetxController {
  late String name, phone, address;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  CountersModels? countersModels;
  getCounters(int idCato) async {
    try {
      var response = await getAllCountersRes(idCato);
      countersModels = await CountersModels.fromJson(response);
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 'error';
    }
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
}
