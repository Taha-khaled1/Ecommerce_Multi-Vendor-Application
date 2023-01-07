// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/navbar.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/Shipping_info_screen/widget/addAdreesContainer.dart';
import 'package:pisti/presentation_layer/screen/cart_screen/cart_screen.dart';

class ShippingInfoScreen extends StatelessWidget {
  const ShippingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCart = Get.arguments['cart'];

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      bottomNavigationBar: isCart == true
          ? BottomNavAuth(
              press: () {
                Get.toNamed(Routes.cart);
                xtemp = true;
                ctemp = true;
              },
              text: 'تابع الى معلومات التسليم')
          : SizedBox(),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return ListView(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  isCart == true ? 'معلومات الشحن' : 'العناوين',
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.kPrimary,
                    fontSize: FontSize.s25,
                  ),
                ),
              ),
              for (int i = 0; i < 2; i++)
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  alignment: Alignment.topRight,
                  width: deviceInfo.localWidth * 0.85,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorManager.grey2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            6,
                            (index) => Text(
                              titels[index],
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.kTextlightgray,
                                fontSize: FontSize.s20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            6,
                            (index) => Text(
                              info[index],
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.kPrimary,
                                fontSize: FontSize.s20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              AddAdreesContainer(
                onTap: () {
                  Get.toNamed(Routes.addressScreen);
                },
                text: 'أضف عنوان جديد',
                width: deviceInfo.localWidth * 0.85,
              ),
            ],
          );
        },
      ),
    );
  }
}

List<String> titels = [
  'عنوان :',
  ' الرمز البريدي :',
  'المدينة :',
  'المحافظة :',
  'البلد :',
  'رقم الهاتف :',
];

List<String> info = [
  'Abudabhi 201',
  '82299',
  'ابوظبي',
  'ابوظبي',
  'الامارات',
  '91700000+',
];
