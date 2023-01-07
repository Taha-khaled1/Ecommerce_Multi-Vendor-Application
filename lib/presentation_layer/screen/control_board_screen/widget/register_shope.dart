import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/valid.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/control_board_controller/control_board_controller.dart';

void registerShope({required ControlBoardController controller}) {
  Get.bottomSheet(
    isScrollControlled: true,
    InfoWidget(
      builder: (context, deviceInfo) {
        return Container(
          height: 500,
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
          child: Form(
            key: controller.formkeysigin,
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
                    return validInput(p0.toString(), 2, 50, 'name');
                  },
                  onsaved: (p0) {
                    return controller.name = p0!;
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
                    return validInput(p0.toString(), 5, 80, 'addres');
                  },
                  onsaved: (p0) {
                    return controller.address = p0!;
                  },
                  titel: 'ادخل عنوان المحل',
                  width: deviceInfo.localWidth * 0.85,
                  height: 70,
                ),
                Text(
                  'رقم الهاتف',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kPrimary,
                    fontSize: FontSize.s20,
                  ),
                ),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 5, 15, 'phone');
                  },
                  onsaved: (p0) {
                    return controller.phone = p0!;
                  },
                  titel: 'ادخل رقم الهاتف',
                  width: deviceInfo.localWidth * 0.85,
                  height: 70,
                ),
                const SizedBox(height: 15),
                GetBuilder<ControlBoardController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: CustomButton(
                        width: deviceInfo.localWidth,
                        haigh: 60,
                        color: ColorManager.kPrimary,
                        text: 'سجل متجرك',
                        press: () {
                          controller.requestShope(context);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
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
