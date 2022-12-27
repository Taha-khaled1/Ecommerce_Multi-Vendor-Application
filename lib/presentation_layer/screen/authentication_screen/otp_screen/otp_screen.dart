import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/navbar.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavAuth(
        press: () {
          Get.toNamed(Routes.homeRoute);
        },
        text: 'متابعه',
      ),
      backgroundColor: Colors.white,
      appBar: appbar(),
      body: Form(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          height: double.infinity,
          child: InfoWidget(
            builder: (context, deviceInfo) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: AppSize.s80),
                    Text(
                      'ادخل الرمز',
                      style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary, fontSize: FontSize.s27),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'تم إرسال رمز مكون من 6 أرقام إلى Hacen.design@gmail.com',
                      style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary, fontSize: FontSize.s18),
                    ),
                    const SizedBox(height: 20),
                    Directionality(
                      // Specify direction if desired
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        length: 6,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: PinTheme(
                            height: 75,
                            width: 70,
                            // margin: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: ColorManager.grey2,
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          return value == '2222' ? null : 'Pin is incorrect';
                        },
                        onClipboardFound: (value) {
                          debugPrint('onClipboardFound: $value');
                          pinController.setText(value);
                        },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              //  color: focusedBorderColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
