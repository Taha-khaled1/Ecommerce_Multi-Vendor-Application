// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/navbar.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/Shipping_info_screen/widget/addAdreesContainer.dart';
import 'package:pisti/presentation_layer/screen/cart_screen/cart_screen.dart';

class ShippingInfoScreen extends StatelessWidget {
  const ShippingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool? isCart = false;

    getData() async {
      var responsev = await sqlDb!.readData("SELECT * FROM adress");
      return responsev;
    }

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      bottomNavigationBar: isCart == true
          ? BottomNavAuth(
              press: () {
                Get.toNamed(Routes.cart);
                xtemp = true;
                ctemp = true;
              },
              text: 'تابع الى معلومات التسليم')
          : SizedBox(),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return ListView(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  isCart == true ? 'معلومات الشحن' : 'العناوين',
                  style: MangeStyles().getRegularStyle(
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
                          for (int i = 0; i < snapshot.data.length; i++)
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              alignment: Alignment.topRight,
                              width: deviceInfo.localWidth * 0.85,
                              height: 210,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: ColorManager.grey2,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        4,
                                        (index) => Text(
                                          titels[index],
                                          style: MangeStyles().getBoldStyle(
                                            color: ColorManager.kTextlightgray,
                                            fontSize: FontSize.s20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data[i]['postal_code']}',
                                            style: MangeStyles().getBoldStyle(
                                              color: ColorManager.kPrimary,
                                              fontSize: FontSize.s20,
                                            ),
                                          ),
                                          Text(
                                            '${snapshot.data[i]['country']}',
                                            style: MangeStyles().getBoldStyle(
                                              color: ColorManager.kPrimary,
                                              fontSize: FontSize.s20,
                                            ),
                                          ),
                                          Text(
                                            '${snapshot.data[i]['city']}',
                                            style: MangeStyles().getBoldStyle(
                                              color: ColorManager.kPrimary,
                                              fontSize: FontSize.s20,
                                            ),
                                          ),
                                          Text(
                                            '${snapshot.data[i]['phone']}',
                                            style: MangeStyles().getBoldStyle(
                                              color: ColorManager.kPrimary,
                                              fontSize: FontSize.s20,
                                            ),
                                          ),
                                        ]),
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
                onTap: () {
                  Get.toNamed(Routes.addressScreen);
                },
                text: 'أضف عنوان جديد',
                width: deviceInfo.localWidth * 0.85,
              ),
            ],
          );
        },
      ),
    );
  }
}

List<String> titels = [
  ' الرمز البريدي :',
  'البلد :',
  'المدينة :',
  'رقم الهاتف :',
];

List<String> info = [
  'Abudabhi 201',
  '82299',
  'ابوظبي',
  'ابوظبي',
  'الامارات',
  '91700000+',
];
