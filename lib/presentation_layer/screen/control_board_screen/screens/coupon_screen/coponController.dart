import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';

class CouponController extends GetxController {
  late String cop, numb;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  void addcop(BuildContext context) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();

      try {
        var respons = await sqlDb!.insertData(
          '''
       INSERT INTO copon
       (cop,numb)
       VALUES
      ('$cop','$numb') ''',
        );
        Get.back();
        Get.back();
        showDilog(context, 'تم اضافة القسيمه بنجاح');
      } catch (e) {
        print(e);
      }
    }
  }
}
