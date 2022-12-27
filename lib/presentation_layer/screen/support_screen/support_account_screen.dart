import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/onboarding_screen.dart';

class SupportAccountScreen extends StatelessWidget {
  const SupportAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: ColorManager.controlercolor,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/support.png'),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -55),
                  child: Container(
                    height: 589,
                    width: deviceInfo.localWidth >= 600
                        ? deviceInfo.localWidth * 0.75
                        : deviceInfo.localWidth * 0.85,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'الحصول على حساب بائع',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s22,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'إذا كنت ترغب في الحصول على حساب بائع والبدء في بيع منتجاتك ، فما عليك سوى ملء المربعات أدناه بالإجابة الصحيحة. وسيقوم الدعم بمراجعة طلبك.',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextlightgray,
                                    fontSize: FontSize.s14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'الاسم واللقب',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kPrimary,
                                    fontSize: FontSize.s20,
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
                                titel: 'الاسم واللقب',
                                width: deviceInfo.localWidth * 0.85,
                                height: 70,
                                isenabledBorder: false,
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'نوع المنتجات اللي توفرها',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kPrimary,
                                    fontSize: FontSize.s20,
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
                                titel: '',
                                width: deviceInfo.localWidth * 0.85,
                                height: 70,
                                isenabledBorder: false,
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'اسم المتجر',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kPrimary,
                                    fontSize: FontSize.s20,
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
                                titel: '',
                                width: deviceInfo.localWidth * 0.85,
                                height: 70,
                                isenabledBorder: false,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Transform.translate(
                            offset: const Offset(0, 30),
                            child: CircleButton(
                              color1: ColorManager.controlercolor,
                              onTap: () {},
                              iconData: 'assets/icons/send.svg',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
