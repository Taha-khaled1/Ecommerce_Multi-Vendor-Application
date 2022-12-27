import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/domain_layer/models/onboarding_model.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/onboarding_controller/onboarding_controller.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController =
        Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: onboardingController.pageController,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return SectionOnboarding(
                      onboard: onBoardingList[index],
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller:
                        onboardingController.pageController, // PageController
                    count: 3,
                    effect: WormEffect(
                      spacing: 7.0,
                      radius: 4.0,
                      dotWidth: 24.0,
                      dotHeight: 6.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: ColorManager.kTextlightgray,
                      activeDotColor: ColorManager.kPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: CircleButton(
                        onTap: () {
                          if (onboardingController.pageController.page!
                                  .toInt() ==
                              2) {
                            sharedPreferences.setString('step', '1');
                            onboardingController.gotoLoginscreen();
                          } else {
                            onboardingController.pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        iconData: 'assets/icons/arrow.svg',
                        color2: ColorManager.white,
                        color1: ColorManager.kPrimary,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SectionOnboarding extends StatelessWidget {
  const SectionOnboarding({
    Key? key,
    required this.onboard,
  }) : super(key: key);
  final OnboardingModel onboard;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSize.s60),
        Image.asset(onboard.image),
        const SizedBox(height: AppSize.s14),
        Text(
          onboard.title,
          style: MangeStyles().getBoldStyle(
              color: ColorManager.kPrimary, fontSize: FontSize.s27),
        ),
        const SizedBox(height: AppSize.s20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            onboard.body,
            textAlign: TextAlign.center,
            style: MangeStyles().getRegularStyle(
                color: ColorManager.kTextlightgray, fontSize: FontSize.s16),
          ),
        ),
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String iconData;
  final Color? color1;
  final Color? color2;
  final double? size;
  final double? sizedsvg;
  const CircleButton({
    Key? key,
    required this.onTap,
    required this.iconData,
    this.color1,
    this.color2,
    this.size,
    this.sizedsvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sized = 70.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size ?? sized,
        height: size ?? sized,
        decoration: BoxDecoration(
          color: color1,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconData,
          color: color2,
          width: sizedsvg ?? 35,
        ),
      ),
    );
  }
}
