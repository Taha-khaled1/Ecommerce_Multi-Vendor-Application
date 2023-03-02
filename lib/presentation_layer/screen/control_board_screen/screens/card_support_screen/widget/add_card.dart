import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

void addCard() {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      color: Colors.white,
      width: double.infinity,
      height: 600,
      child: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'اضافة تذكره جديده',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card holder Name",
                        style: MangeStyles().getRegularStyle(
                          color: ColorManager.kTextblack,
                          fontSize: FontSize.s18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextfeild(
                        valid: (p0) {
                          return null;
                        },
                        onsaved: (p0) {
                          return null;
                        },
                        titel: 'Enter your name as written on card',
                        width: deviceInfo.localWidth,
                        height: 60,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Card Number",
                        style: MangeStyles().getRegularStyle(
                          color: ColorManager.kTextblack,
                          fontSize: FontSize.s18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextfeild(
                        valid: (p0) {
                          return null;
                        },
                        onsaved: (p0) {
                          return null;
                        },
                        titel: 'Enter card number',
                        width: deviceInfo.localWidth,
                        height: 60,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "cvv/cvc",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: const Color(0xFF1A1A1A),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CustomTextfeild(
                                  valid: (p0) {
                                    return null;
                                  },
                                  onsaved: (p0) {
                                    return null;
                                  },
                                  titel: '123',
                                  width: deviceInfo.localWidth,
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Exp. Date",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: const Color(0xFF1A1A1A),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CustomTextfeild(
                                  valid: (p0) {
                                    return null;
                                  },
                                  onsaved: (p0) {
                                    return null;
                                  },
                                  titel: '20/20',
                                  width: deviceInfo.localWidth,
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    width: deviceInfo.localWidth * 0.85,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: 'حفظ',
                    press: () {},
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
  );
}
