import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  void gotoLoginscreen() {
    Get.offAndToNamed(Routes.loginRoute);
  }
}
