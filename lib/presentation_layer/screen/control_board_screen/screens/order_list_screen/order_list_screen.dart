import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/onboarding_screen.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'قائمة الرغبات',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s25,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: ColorManager.kTextblack),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Rectangle 26-1.png',
                                height: 125,
                                fit: BoxFit.cover,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: 'شاي للتنحيف\n',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s18,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'الكمية : 01',
                                      style: MangeStyles().getBoldStyle(
                                        color: ColorManager.kTextlightgray,
                                        fontSize: FontSize.s16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(-40, -17),
                                      child: CircleButton(
                                        size: 36,
                                        sizedsvg: 25,
                                        color1: ColorManager.grey2,
                                        onTap: () {},
                                        iconData: 'assets/icons/trash2.svg',
                                        color2: ColorManager.kPrimary,
                                      ),
                                    ),
                                    Text(
                                      'Dec 02, 2022',
                                      style: MangeStyles().getRegularStyle(
                                        color: ColorManager.kTextlightgray,
                                        fontSize: FontSize.s18,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: 'السعر :\n',
                                          style: MangeStyles().getRegularStyle(
                                            color: ColorManager.kTextblack,
                                            fontSize: FontSize.s18,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'AED200.00',
                                              style: MangeStyles().getBoldStyle(
                                                color: ColorManager.kPrimary,
                                                fontSize: FontSize.s20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
