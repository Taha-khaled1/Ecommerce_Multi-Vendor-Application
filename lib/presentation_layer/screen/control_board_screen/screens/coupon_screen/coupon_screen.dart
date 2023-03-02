import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/valid.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/Shipping_info_screen/widget/addAdreesContainer.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/coupon_screen/coponController.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});
  Future getData() async {
    var responsev = await sqlDb!.readData("SELECT * FROM copon");
    return responsev;
  }

  @override
  Widget build(BuildContext context) {
    final CouponController controller = Get.put(CouponController());
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
                FutureBuilder(
                  builder: (ctx, snapshot) {
                    // Checking if future is resolved or not
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If we got an error
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            '${snapshot.error} occurred',
                            style: TextStyle(fontSize: 18),
                          ),
                        );

                        // if we got our data
                      } else if (snapshot.hasData) {
                        // Extracting data from snapshot object

                        return Column(
                          children: [
                            for (int i = 0; i < snapshot.data?.length; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: ColorManager.grey2,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: ColorManager.kPrimary)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'قسيمة تخفيض ${'${snapshot.data[i]['numb']}'} لكل المنتجات',
                                        style: MangeStyles().getBoldStyle(
                                          color: ColorManager.kTextlightgray,
                                          fontSize: FontSize.s20,
                                        ),
                                      ),
                                      Text(
                                        '${'${snapshot.data[i]['cop']}'}',
                                        style: MangeStyles().getBoldStyle(
                                          color: ColorManager.kPrimary,
                                          fontSize: FontSize.s22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );
                      }
                    }

                    // Displaying LoadingSpinner to indicate waiting state
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },

                  // Future that needs to be resolved
                  // inorder to display something on the Canvas
                  future: getData(),
                ),
                AddAdreesContainer(
                  width: deviceInfo.localWidth,
                  text: 'أضف Coupon جديد',
                  onTap: () {
                    addCop();
                  },
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

void addCop() {
  Get.bottomSheet(
    isScrollControlled: true,
    InfoWidget(
      builder: (context, deviceInfo) {
        return GetBuilder<CouponController>(
          init: CouponController(),
          builder: (controller) {
            return Container(
              height: 500,
              padding: EdgeInsets.symmetric(
                horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Form(
                key: controller.formkeysigin,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'اضافة قسيمة',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s25,
                        ),
                      ),
                    ),
                    Text(
                      'اسم قسيمة',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    CustomTextfeild(
                      valid: (p0) {
                        return validInput(p0.toString(), 2, 50, 'name');
                      },
                      onsaved: (p0) {
                        return controller.cop = p0!;
                      },
                      titel: 'ادخل اسم قسيمة',
                      width: deviceInfo.localWidth * 0.85,
                      height: 70,
                    ),
                    Text(
                      'ادخل عدد المنتجات لهذه القسيمه',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    CustomTextfeild(
                      valid: (p0) {
                        return validInput(p0.toString(), 1, 15, 'ddd');
                      },
                      onsaved: (p0) {
                        return controller.numb = p0!;
                      },
                      titel: 'ادخل رقم الهاتف',
                      width: deviceInfo.localWidth * 0.85,
                      height: 70,
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      width: deviceInfo.localWidth,
                      haigh: 60,
                      color: ColorManager.kPrimary,
                      text: 'سجل متجرك',
                      press: () {
                        controller.addcop(context);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
  );
}
