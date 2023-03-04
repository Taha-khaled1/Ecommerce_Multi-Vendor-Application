// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/alerttoken.dart';

class BottomNavHomeScreen extends StatelessWidget {
  const BottomNavHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: (() {
              Get.toNamed(Routes.homeRoute);
            }),
            icon: SvgPicture.asset(
              'assets/icons/home3.svg',
              color: ColorManager.navbar,
            ),
          ),
          IconButton(
            onPressed: (() {}),
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: ColorManager.navbar,
            ),
          ),
          IconButton(
            onPressed: (() {
              if (sharedPreferences.getString('access_token') == 'null' ||
                  sharedPreferences.getString('access_token') == null) {
                aleartToken(context);
              } else {
                Get.toNamed(Routes.chatScreen);
              }
            }),
            icon: SvgPicture.asset(
              'assets/icons/envelope.svg',
              color: ColorManager.navbar,
            ),
          ),
          IconButton(
            onPressed: (() {
              if (sharedPreferences.getString('access_token') == 'null' ||
                  sharedPreferences.getString('access_token') == null) {
                aleartToken(context);
              } else {
                Get.toNamed(Routes.controlBoardRoute);
              }
            }),
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: ColorManager.navbar,
            ),
          ),
        ],
      ),
    );
  }
}
