import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/valid.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/signup_screen/signup_controller/signup_controller.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: InfoWidget(
            builder: (context, deviceInfo) {
              return SizedBox(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      width: deviceInfo.localWidth * 0.85,
                      haigh: 60,
                      color: ColorManager.kPrimary,
                      text: 'انشئ حسابك',
                      press: () {
                        controller.register(context: context);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.loginRoute);
                          },
                          child: Text(
                            'هل لديك حساب؟',
                            textAlign: TextAlign.left,
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextlightgray,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.homeRoute);
                          },
                          child: Text(
                            'الدخول كازائر',
                            textAlign: TextAlign.left,
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kPrimary,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
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
                    key: signupController.formkeysigin,
                    child: ListView(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'انشئ حساب',
                            style: MangeStyles().getBoldStyle(
                                color: ColorManager.kPrimary,
                                fontSize: FontSize.s27),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'الاسم الكامل',
                                textAlign: TextAlign.right,
                                style: MangeStyles().getBoldStyle(
                                  color: ColorManager.kPrimary,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ),
                            CustomTextfeild(
                              icon: Icons.person,
                              valid: (p0) {
                                return validInput(
                                    p0.toString(), 1, 100, 'type');
                              },
                              onsaved: (p0) {
                                return signupController.name = p0.toString();
                              },
                              titel: 'ادخل اسمك الكامل',
                              width: deviceInfo.localWidth,
                              height: 65,
                            ),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'بريد الكتروني',
                                textAlign: TextAlign.right,
                                style: MangeStyles().getBoldStyle(
                                  color: ColorManager.kPrimary,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ),
                            CustomTextfeild(
                              icon: Icons.email_outlined,
                              valid: (p0) {
                                return validInput(
                                    p0.toString(), 1, 100, 'email');
                              },
                              onsaved: (p0) {
                                return signupController.email = p0.toString();
                              },
                              titel: 'ادخل بريدك الاكتروني',
                              width: deviceInfo.localWidth,
                              height: 65,
                            ),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'رقم الهاتف الخاص بك',
                                textAlign: TextAlign.right,
                                style: MangeStyles().getBoldStyle(
                                  color: ColorManager.kPrimary,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ),
                            CustomTextfeild(
                              icon: Icons.person,
                              valid: (p0) {
                                return validInput(
                                    p0.toString(), 1, 100, 'type');
                              },
                              onsaved: (p0) {
                                return signupController.phone = p0.toString();
                              },
                              titel: 'ادخل رقم هاتفك',
                              width: deviceInfo.localWidth,
                              height: 65,
                            ),
                            const SizedBox(height: 15),
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
                            GetBuilder<SignupController>(
                              builder: (controller) {
                                return CustomTextfeild(
                                  maxLines: 1,
                                  iconontap: () {
                                    controller.obSecuer();
                                  },
                                  obsecuer: controller.obsecuer,
                                  icon: controller.obsecuer == true
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  valid: (p0) {
                                    return validInput(
                                        p0.toString(), 1, 100, 'password');
                                  },
                                  onsaved: (p0) {
                                    return signupController.password =
                                        p0.toString();
                                  },
                                  titel: 'ادخل كلمة السر',
                                  width: deviceInfo.localWidth,
                                  height: 65,
                                );
                              },
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
