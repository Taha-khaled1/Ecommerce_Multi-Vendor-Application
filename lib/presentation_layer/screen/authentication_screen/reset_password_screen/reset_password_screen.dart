import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/components/navbar.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavAuth(
        press: () {
          Get.toNamed(Routes.sucssRoute);
        },
        text: 'متابعه',
      ),
      backgroundColor: Colors.white,
      appBar: appbar(),
      body: Container(
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
                    'إعادة تعيين كلمة المرور',
                    style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary, fontSize: FontSize.s27),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'كلمة السر',
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.kPrimary,
                            fontSize: FontSize.s18,
                          ),
                        ),
                      ),
                      CustomTextfeild(
                        valid: (p0) {
                          return null;
                        },
                        onsaved: (p0) {
                          return null;
                        },
                        titel: 'ادخل كلمة السر',
                        width: deviceInfo.localWidth,
                        height: 65,
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'تأكيد كلمة السر',
                          textAlign: TextAlign.right,
                          style: MangeStyles().getBoldStyle(
                              color: ColorManager.kPrimary,
                              fontSize: FontSize.s18),
                        ),
                      ),
                      CustomTextfeild(
                        valid: (p0) {
                          return null;
                        },
                        onsaved: (p0) {
                          return null;
                        },
                        titel: 'تأكيد كلمة السر',
                        width: deviceInfo.localWidth,
                        height: 65,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
