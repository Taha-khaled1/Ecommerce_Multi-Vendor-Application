import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

void registerShope() {
  Get.bottomSheet(
    isScrollControlled: true,
    InfoWidget(
      builder: (context, deviceInfo) {
        return Container(
          height: 380,
          padding: EdgeInsets.symmetric(
            horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 7,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'إعدادات المتجر',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kPrimary,
                    fontSize: FontSize.s25,
                  ),
                ),
              ),
              Text(
                'اسم المحل',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s20,
                ),
              ),
              CustomTextfeild(
                valid: (p0) {
                  return null;
                },
                onsaved: (p0) {
                  return null;
                },
                titel: 'ادخل اسم المحل',
                width: deviceInfo.localWidth * 0.85,
                height: 70,
              ),
              Text(
                'عنوان المحل',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s20,
                ),
              ),
              CustomTextfeild(
                valid: (p0) {
                  return null;
                },
                onsaved: (p0) {
                  return null;
                },
                titel: 'ادخل عنوان المحل',
                width: deviceInfo.localWidth * 0.85,
                height: 70,
              ),
              const SizedBox(height: 15),
              CustomButton(
                width: deviceInfo.localWidth,
                haigh: 60,
                color: ColorManager.kPrimary,
                text: 'سجل متجرك',
                press: () {},
              )
            ],
          ),
        );
      },
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
  );
}
