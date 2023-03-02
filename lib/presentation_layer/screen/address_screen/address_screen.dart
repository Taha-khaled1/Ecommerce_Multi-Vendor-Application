import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/valid.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/components/navbar.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

import 'address_controller/address_controller.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddressController controller = Get.put(AddressController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      bottomNavigationBar: BottomNavAuth(
        press: () {
          controller.addadress(context);

          //  Get.toNamed(Routes.shippingInfoRoute,arguments: {'cart':true});
        },
        text: 'حفظ',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'عنوان جديد',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s25,
                ),
              ),
            ),
            AllFieldAddress(controller: controller)
          ],
        ),
      ),
    );
  }
}

class AllFieldAddress extends StatelessWidget {
  const AllFieldAddress({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final AddressController controller;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: controller.formkeysigin,
            child: Column(
              children: [
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'type');
                  },
                  onsaved: (p0) {
                    return controller.country = p0.toString();
                  },
                  titel: 'اكتب اسم بلدك',
                  width: deviceInfo.localWidth * 0.9,
                  height: 60,
                ),
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'type');
                  },
                  onsaved: (p0) {
                    return controller.city = p0.toString();
                  },
                  titel: 'المدينه',
                  width: deviceInfo.localWidth * 0.9,
                  height: 60,
                ),
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'type');
                  },
                  onsaved: (p0) {
                    return controller.post = p0.toString();
                  },
                  titel: 'رمزك البريدي',
                  width: deviceInfo.localWidth * 0.9,
                  height: 60,
                ),
                const SizedBox(height: 15),
                CustomTextfeild(
                  valid: (p0) {
                    return validInput(p0.toString(), 1, 100, 'phone');
                  },
                  onsaved: (p0) {
                    return controller.phone = p0.toString();
                  },
                  titel: 'رقم هاتفك',
                  width: deviceInfo.localWidth * 0.9,
                  height: 60,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
