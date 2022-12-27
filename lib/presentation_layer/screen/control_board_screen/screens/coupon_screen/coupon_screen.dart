import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/Shipping_info_screen/widget/addAdreesContainer.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

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
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'أضف Coupon لمنتجاتك',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s25,
                    ),
                  ),
                ),
                for (int i = 0; i < 2; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 130,
                      decoration: BoxDecoration(
                          color: ColorManager.grey2,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: ColorManager.kPrimary)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'قسيمة تخفيض 20 لكل المنتجات',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextlightgray,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          Text(
                            'HXN20',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kPrimary,
                              fontSize: FontSize.s22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                AddAdreesContainer(
                  width: deviceInfo.localWidth,
                  text: 'أضف Coupon جديد',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
