// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customListtile.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/shope_settinges.dart';

class AllListtileControllerBoard extends StatelessWidget {
  const AllListtileControllerBoard({
    Key? key,
  }) : super(key: key);

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
          image: 'assets/icons/Frame 17.svg',
          titel: 'الطلبات',
          onTap: () {
            Get.toNamed(Routes.orderListScreen);
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
          image: 'assets/icons/Frame 27.svg', //assets/icons/Frame 27.svg
          titel: 'المحادثات',
          onTap: () {
            Get.toNamed(Routes.chatScreen);
          },
        ),
        Column(
          children: [
            CustomListtile(
              image: 'assets/icons/paperclip.svg', //assets/icons/Frame 26.svg
              titel: 'منتجات رقمية',
              onTap: () {},
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
                xc();
              },
            ),
            CustomListtile(
              image: 'assets/icons/map-pin.svg', //assets/icons/Frame 19.svg
              titel: 'العناوين',
              onTap: () {
                Get.toNamed(Routes.shippingInfoRoute);
              },
            ),
            CustomListtile(
              image: 'assets/icons/calendar.svg', //assets/icons/Frame 27.svg
              titel: 'تاريخ دفع',
              onTap: () {},
            ),
          ],
        ),
        CustomListtile(
          image: 'assets/icons/Frame 24.svg', //assets/icons/Frame 24.svg
          titel: 'بطاقة الدعم',
          onTap: () {
            Get.toNamed(Routes.cardSupportScreen);
          },
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
          image: 'assets/icons/Frame 25.svg',
          titel: 'تسجيل خروج',
          onTap: () {},
        ),
      ],
    );
  }
}
