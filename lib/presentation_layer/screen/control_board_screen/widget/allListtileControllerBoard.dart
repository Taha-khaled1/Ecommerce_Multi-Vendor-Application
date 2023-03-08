// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/control_board_controller/control_board_controller.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/chat_screen/notification_list_controller.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customListtile.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/shope_settinges.dart';
import 'package:quickalert/quickalert.dart';

class AllListtileControllerBoard extends StatelessWidget {
  const AllListtileControllerBoard({
    Key? key,
    required this.controller,
    required this.torf,
  }) : super(key: key);
  final ControlBoardController controller;
  final bool torf;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListtile(
          image: 'assets/icons/Frame 26.svg', //assets/icons/Frame 26.svg
          titel: 'الملف الشخصي',
          onTap: () {
            Get.toNamed(Routes.profilePersonlyScreen);
          },
        ),
        CustomListtile(
          image: 'assets/icons/Frame 19.svg', //assets/icons/Frame 19.svg
          titel: 'قائمة الرغبات',
          onTap: () {
            Get.toNamed(Routes.favouriteScreen);
          },
        ),
        CustomListtile(
          image: 'assets/icons/Frame 19.svg', //assets/icons/Frame 19.svg
          titel: 'المحادثات',
          onTap: () {
            Get.to(() => ChateScreen());
          },
        ),
        Column(
          children: [
            CustomListtile(
              image: 'assets/icons/paperclip.svg', //assets/icons/Frame 26.svg
              titel: 'منتجات رقمية',
              onTap: () {
                Get.toNamed(
                  Routes.moreproduct,
                  arguments: [6],
                );
              },
            ),
            CustomListtile(
              image: 'assets/icons/upload.svg',
              titel: 'تحميل منتجات ',
              onTap: () {
                Get.toNamed(Routes.addProductScreen);
              },
            ),
            CustomListtile(
              image: 'assets/icons/discount.svg', //assets/icons/Frame 19.svg
              titel: 'القسيمة',
              onTap: () {
                Get.toNamed(Routes.couponRoute);
              },
            ),
            CustomListtile(
              image: 'assets/icons/settings.svg', //assets/icons/Frame 27.svg
              titel: 'اعدادات المتجر',
              onTap: () {
                xc(controller: controller);
              },
            ),
            CustomListtile(
              image: 'assets/icons/map-pin.svg', //assets/icons/Frame 19.svg
              titel: 'العناوين',
              onTap: () {
                Get.toNamed(Routes.shippingInfoRoute,
                    arguments: {'cart': false});
              },
            ),
          ],
        ),
        CustomListtile(
          image:
              'assets/icons/technical-support (1).svg', //assets/icons/Frame 24.svg
          titel: 'التواصل مع الدعم',
          onTap: () {
            Get.toNamed(Routes.supportProblemScreen);
          },
        ),
        CustomListtile(
          widget: Icon(
            Icons.delete_outline,
            size: 32,
            color: Colors.black,
          ),
          titel: 'حذف الحساب',
          onTap: () {
            QuickAlert.show(
              showCancelBtn: true,
              context: context,
              type: QuickAlertType.warning,
              text:
                  'سيتم حذف الحساب الخاص بك نهائيا من\n قاعدة البيانات الخاصه بنا ',
              title: 'هل متاكد من حذف الحساب',
              cancelBtnText: 'تراجع',
              confirmBtnText: 'نعم متاكد',
              confirmBtnColor: ColorManager.error,
              onCancelBtnTap: () {
                Get.back();
              },
              onConfirmBtnTap: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.warning,
                  text:
                      '  سيتم حذف الحساب الخاص بك نهائيا من قاعدة البيانات الخاصه بنا\n في خلال 30 يوم من الان ويمكنك الدخول اليه ف هذه الوقت',
                  title: 'الحاله',
                  onConfirmBtnTap: () {
                    Get.back();
                    Get.back();
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
