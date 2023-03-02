import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customListtile.dart';

void xc({required ControlBoardController controller}) {
  Get.bottomSheet(
    isScrollControlled: true,
    InfoWidget(
      builder: (context, deviceInfo) {
        return GetBuilder<ControlBoardController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest3,
              widget: Container(
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
                child: Form(
                  key: controller.formkeysigin4,
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
                          return validInput(p0.toString(), 1, 100, 'type');
                        },
                        onsaved: (p0) {
                          return controller.namee = p0.toString();
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
                        onTap: () {
                          handleAttachmentPressed(context);
                        },
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
                          return validInput(p0.toString(), 1, 100, 'phone');
                        },
                        onsaved: (p0) {
                          return controller.phonee = p0.toString();
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
                          return validInput(p0.toString(), 1, 100, 'address');
                        },
                        onsaved: (p0) {
                          return controller.addresse = p0.toString();
                        },
                        titel: 'Abudabhi 201,82299 ابوظبي',
                        width: deviceInfo.localWidth * 0.85,
                        height: 70,
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                        width: deviceInfo.localWidth,
                        haigh: 60,
                        color: ColorManager.kPrimary,
                        text: 'حفظ',
                        press: () {
                          controller.editeShope(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
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

void handleAttachmentPressed(
  BuildContext context,
) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) => SafeArea(
      child: SizedBox(
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomListtile(
              widget: Icon(Icons.camera_alt_outlined),
              onTap: () async {
                Navigator.pop(context);

                getImage(ImageSource.camera);
              },
              titel: 'التقاط صوره',
            ),
            CustomListtile(
              //    color: ColorManager.ktextblackk,
              widget: Icon(Icons.photo),
              onTap: () {
                Navigator.pop(context);
                getImage(ImageSource.gallery);
              },
              titel: 'اختار صوره',
            ),
            CustomListtile(
              widget: Icon(
                Icons.arrow_back_ios_outlined,
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                Navigator.pop(context);
              },
              titel: 'الرجوع للخلف',
            ),
          ],
        ),
      ),
    ),
  );
}

getImage(
  ImageSource source,
) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile;
  pickedFile = await imagePicker.pickImage(source: source);
}
