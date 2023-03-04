import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

void showDilog(BuildContext context, String massg,
    {QuickAlertType? type, void Function()? onConfirmBtnTap}) {
  QuickAlert.show(
    context: context,
    type: type ?? QuickAlertType.success,
    text: massg,
    confirmBtnText: 'موافق',
    cancelBtnText: 'No',
    onConfirmBtnTap: onConfirmBtnTap ??
        () {
          Get.back();
        },
    confirmBtnColor: Colors.green,
  );
}
