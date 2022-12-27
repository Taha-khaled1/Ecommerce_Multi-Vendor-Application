import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

class SucssScreen extends StatelessWidget {
  const SucssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      backgroundColor: ColorManager.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: AppSize.s60),
            Image.asset('assets/images/undraw_Shopping_re_hdd9 1.png'),
            Text(
              1 == 2
                  ? 'تم تعيين كلمة المرور \nبنجاح'
                  : 'تم الطلب بنجاح .شكرا على ثقتك',
              textAlign: TextAlign.center,
              style: MangeStyles().getBoldStyle(
                color: ColorManager.kPrimary,
                fontSize: FontSize.s27,
              ),
            ),
            CustomButton(
              width: 300,
              haigh: 60,
              color: ColorManager.kPrimary,
              text: 'عد للحساب',
              press: () {
                Get.toNamed(Routes.homeRoute);
              },
            ),
            const SizedBox(height: AppSize.s32),
          ],
        ),
      ),
    );
  }
}
