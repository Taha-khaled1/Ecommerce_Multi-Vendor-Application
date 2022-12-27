import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customListtile.dart';

void xc() {
  Get.bottomSheet(
    isScrollControlled: true,
    InfoWidget(
      builder: (context, deviceInfo) {
        return Container(
          height: deviceInfo.localHeight * 0.8,
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
                titel: 'Hacen Test',
                width: deviceInfo.localWidth * 0.85,
                height: 70,
              ),
              const SizedBox(height: 15),
              Text(
                'شعار المتجر',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s20,
                ),
              ),
              CustomListtile(
                image: 'assets/icons/image.svg',
                textStyle: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextlightgray,
                  fontSize: FontSize.s18,
                ),
                onTap: () {},
                titel: 'إضافة صورة',
              ),
              const SizedBox(height: 15),
              Text(
                'رقم هاتف المحل',
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
                titel: 'ادخل رقم هاتف المحل',
                width: deviceInfo.localWidth * 0.85,
                height: 70,
              ),
              const SizedBox(height: 15),
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
                titel: 'Abudabhi 201,82299 ابوظبي',
                width: deviceInfo.localWidth * 0.85,
                height: 70,
              ),
              const SizedBox(height: 15),
              Text(
                'إعدادات البانر',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s20,
                ),
              ),
              CustomListtile(
                image: 'assets/icons/image.svg',
                onTap: () {},
                titel: 'إضافة صورة لافتات (1500x450)',
                textStyle: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextlightgray,
                  fontSize: FontSize.s18,
                ),
              ),
              const SizedBox(height: 15),
              CustomButton(
                width: deviceInfo.localWidth,
                haigh: 60,
                color: ColorManager.kPrimary,
                text: 'حفظ',
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
