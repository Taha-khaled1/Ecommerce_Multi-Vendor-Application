import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/valid.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/components/navbar.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

import 'reset_password_controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavAuth(
            press: () {
              controller.resetPass(context: context);
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
                  child: Form(
                    key: controller.formkeysigin,
                    child: ListView(
                      children: [
                        const SizedBox(height: AppSize.s80),
                        Text(
                          'إعادة تعيين كلمة المرور',
                          style: MangeStyles().getBoldStyle(
                              color: ColorManager.kPrimary,
                              fontSize: FontSize.s27),
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
                                return validInput(
                                    p0.toString(), 1, 100, 'password');
                              },
                              onsaved: (p0) {
                                return controller.pass = p0.toString();
                                ;
                              },
                              titel: 'ادخل كلمة السر',
                              width: deviceInfo.localWidth,
                              height: 65,
                              icon: Icons.password,
                              obsecuer: true,
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'ارجاء ادخال الكود',
                                textAlign: TextAlign.right,
                                style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kPrimary,
                                    fontSize: FontSize.s18),
                              ),
                            ),
                            CustomTextfeild(
                              valid: (p0) {
                                return validInput(p0.toString(), 5, 7, 'code');
                              },
                              onsaved: (p0) {
                                return controller.code = p0.toString();
                              },
                              titel: 'تأكيد كلمة السر',
                              width: deviceInfo.localWidth,
                              height: 65,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
