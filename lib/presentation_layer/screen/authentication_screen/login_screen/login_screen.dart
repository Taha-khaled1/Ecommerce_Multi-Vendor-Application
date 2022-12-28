import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/valid.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/login_screen/login_controller/login_controller.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      bottomNavigationBar: InfoWidget(
        builder: (context, deviceInfo) {
          return SizedBox(
            height: 130,
            child: Column(
              children: [
                CustomButton(
                  width: deviceInfo.localWidth * 0.85,
                  haigh: 60,
                  color: ColorManager.kPrimary,
                  text: 'تسجيل الدخول',
                  press: () {
                    loginController.login();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'عضو جديد ؟',
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.kTextlightgray,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        loginController.gotoRegisterRoute();
                      },
                      child: Text(
                        'سجل الان',
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
              child: GetBuilder<LoginController>(
                builder: (controller) {
                  return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formkeysigin,
                      child: ListView(
                        children: [
                          Text(
                            'تسجيل الدخول',
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
                                  'بريد الكتروني',
                                  textAlign: TextAlign.right,
                                  style: MangeStyles().getBoldStyle(
                                      color: ColorManager.kPrimary,
                                      fontSize: FontSize.s18),
                                ),
                              ),
                              CustomTextfeild(
                                icon: Icons.email_outlined,
                                valid: (p0) {
                                  return validInput(
                                      p0.toString(), 5, 100, 'email');
                                },
                                onsaved: (p0) {
                                  return controller.emaillog = p0!;
                                },
                                titel: 'ادخل بريدك الاكتروني',
                                width: deviceInfo.localWidth,
                                height: 65,
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'كلمة السر',
                                  style: MangeStyles().getBoldStyle(
                                      color: ColorManager.kPrimary,
                                      fontSize: FontSize.s18),
                                ),
                              ),
                              GetBuilder<LoginController>(
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
                                          p0.toString(), 5, 100, 'password');
                                    },
                                    onsaved: (p0) {
                                      return controller.passwordlog = p0!;
                                    },
                                    titel: 'ادخل كلمة السر',
                                    width: deviceInfo.localWidth,
                                    height: 65,
                                  );
                                },
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              loginController.gotoForgotPasswordRoute();
                            },
                            child: Text(
                              'نسيت كلمة السر',
                              textAlign: TextAlign.left,
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.kTextlightgray,
                                fontSize: FontSize.s18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
