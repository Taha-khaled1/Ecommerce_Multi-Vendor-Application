import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customListtile.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'أضف منتجات',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'اسم المنتج',
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
                    titel: 'الاسم',
                    width: deviceInfo.localWidth * 0.85,
                    height: 70,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'نوع المنتج',
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
                    titel: 'Beauty Products',
                    width: deviceInfo.localWidth * 0.85,
                    height: 70,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'وصف المنتج',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  CustomTextfeild(
                    fillColor: ColorManager.grey2,
                    maxLines: 8,
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'ادخل وصف المنتج',
                    width: deviceInfo.localWidth * 0.85,
                    height: 140,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'صور المنتج',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  CustomListtile(
                    image: 'assets/icons/image.svg',
                    onTap: () {},
                    titel: 'إضافة صور',
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
      ),
    );
  }
}
