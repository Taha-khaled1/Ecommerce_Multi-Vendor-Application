import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_controller/home_controller.dart';

import 'home_screen/home_screen.dart';

class CatogeryScreen extends StatelessWidget {
  const CatogeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: Navb(),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest1,
            widget: Container(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                itemCount: controller.catogeryModels?.data?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.moreproduct,
                        arguments: [
                          controller.catogeryModels?.data?[index].id ?? 6
                        ],
                      );
                    },
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.only(
                          top: 10, right: 7, left: 7, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 4),
                            color: Colors.grey.withOpacity(0.7),
                          ),
                          BoxShadow(
                            offset: Offset(4, 1),
                            color: Colors.grey.withOpacity(0.7),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.catogeryModels?.data?[index].name ??
                                  'name',
                              style: MangeStyles().getRegularStyle(
                                color: ColorManager.kTextblack,
                                fontSize: FontSize.s22,
                              ),
                            ),
                            Icon(
                              Icons.category_outlined,
                              size: 38,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
