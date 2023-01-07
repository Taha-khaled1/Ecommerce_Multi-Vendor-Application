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
import 'package:pisti/presentation_layer/screen/cart_screen/cart_controller/cart_controller.dart';
import 'package:pisti/presentation_layer/screen/cart_screen/widget/cart_card.dart';
import 'package:pisti/presentation_layer/screen/cart_screen/widget/final_price.dart';

bool xtemp = false;
bool ctemp = false;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      bottomNavigationBar: BottomNavAuth(
        press: () {
          xtemp == false
              ? Get.toNamed(Routes.shippingInfoRoute, arguments: {'cart': true})
              : Get.toNamed(Routes.sucssRoute);
        },
        text: 'تابع للشحن',
      ),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Column(
            children: [
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

                      return Expanded(
                        child: ListView.builder(
                          itemCount: controller.carModelsdemo.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartCard(
                              cart: controller.carModelsdemo[index],
                            );
                          },
                        ),
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
                future: controller.getCartList(
                  int.parse(
                    sharedPreferences.getString('id').toString(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const Divider(
                      thickness: 2,
                    ),
                    xtemp == false
                        ? GetBuilder<CartController>(
                            builder: (controller) {
                              return Column(
                                children: [
                                  FinalPrice(
                                    title: 'المجموع الفرعي',
                                    price: controller.totelPrice.toString(),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FinalPrice(
                                    title: 'ضريبة',
                                    price: controller.totelTex.toString(),
                                  ),
                                ],
                              );
                            },
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'اختر نوع التسليم',
                                style: MangeStyles().getBoldStyle(
                                  color: ColorManager.kPrimary,
                                  fontSize: FontSize.s20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 75,
                                width: deviceInfo.localWidth * 0.85,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  color: ColorManager.grey2,
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: ColorManager.kPrimary),
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    'توصيل منزلي',
                                    style: MangeStyles().getBoldStyle(
                                      color: ColorManager.kTextblack,
                                      fontSize: FontSize.s18,
                                    ),
                                  ),
                                  value: ctemp,
                                  groupValue: 'g',
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
