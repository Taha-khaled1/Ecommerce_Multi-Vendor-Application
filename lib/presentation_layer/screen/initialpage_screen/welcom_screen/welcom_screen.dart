import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/welcom_controller/welcom_controller.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/resources/assets_manager.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController welcomeController = Get.put(WelcomeController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageAssets.background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SizedBox(
                width: deviceInfo.localWidth,
                height: deviceInfo.localHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSize.s60),
                    Image.asset(
                      'assets/images/Logo.png',
                      height: 111,
                    ),
                    const SizedBox(height: AppSize.s12),
                    Text(
                      'اعثر على كل ما تحتاجه في تطبيق واحد فقط',
                      style: MangeStyles().getBoldStyle(
                          color: ColorManager.white, fontSize: FontSize.s25),
                    ),
                    const Expanded(child: SizedBox()),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        width: deviceInfo.localWidth * AppDeviceSize.m80,
                        haigh: 50,
                        color: ColorManager.kPrimary,
                        text: 'مرحبا بك',
                        press: () {
                          welcomeController.gotoOnBoarding();
                        },
                        rectangel: 25,
                      ),
                    ),
                    const SizedBox(height: AppSize.s40),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
