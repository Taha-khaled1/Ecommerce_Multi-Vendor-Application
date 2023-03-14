import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/onlyrating.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_controller/home_controller.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/alerttoken.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/product_card.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/titelcard.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/onboarding_screen.dart';
import 'package:pisti/presentation_layer/screen/product_detalis/product_detalis_controller/product_detalis_controller.dart';
import 'package:pisti/presentation_layer/screen/product_detalis/widget/iIncrasing_or_decrasing.dart';

class ProductDetalisScreen extends StatelessWidget {
  const ProductDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    final ProductDetalisController controller =
        Get.put(ProductDetalisController());
    final HomeController homecontroller = Get.put(HomeController());
    return Scaffold(
      body: FutureBuilder(
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

              return Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        height: 370,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                '${APiMange.baseurlImage}/${controller.productDetalisModels?.data![0].thumbnailImage.toString()}'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, top: 10),
                          child: CircleButton(
                            size: 50,
                            color1: Colors.grey[200],
                            onTap: () {
                              Get.back();
                            },
                            iconData: 'assets/icons/arrow.svg',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                controller
                                        .productDetalisModels?.data![0].name ??
                                    'name',
                                style: MangeStyles().getBoldStyle(
                                  color: ColorManager.kTextblack,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ),
                            Text(
                              controller.productDetalisModels?.data![0]
                                      .description ??
                                  'descrebtion',
                              style: MangeStyles().getRegularStyle(
                                color: ColorManager.kTextlightgray,
                                fontSize: FontSize.s16,
                              ),
                            ),
                            SizedBox(height: 15),
                            RichText(
                              text: TextSpan(
                                text: 'تم بيعها من قبل :',
                                style: MangeStyles().getRegularStyle(
                                  color: ColorManager.kTextblack,
                                  fontSize: FontSize.s14,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: controller.productDetalisModels
                                        ?.data![0].shopName,
                                    style: MangeStyles().getRegularStyle(
                                      color: ColorManager.kPrimary,
                                      fontSize: FontSize.s14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            OnlyRating(
                              nmuberstar: controller
                                      .productDetalisModels?.data![0].rating ??
                                  0,
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GetBuilder<ProductDetalisController>(
                                    builder: (controller) {
                                      return IncrasingorDecrasing(
                                        fontsize: AppSize.s32,
                                        size: 40,
                                        count: controller.count,
                                        onTapAdd: () {
                                          controller.icrasingCount();
                                        },
                                        onTapmuns: () {
                                          controller.decrasingCount();
                                        },
                                      );
                                    },
                                  ),
                                  Text(
                                    controller.productDetalisModels?.data![0]
                                            .mainPrice ??
                                        'AED 000',
                                    style: MangeStyles().getBoldStyle(
                                      color: ColorManager.kPrimary,
                                      fontSize: FontSize.s25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  width: 150,
                                  rectangel: 10,
                                  fontSize: 18,
                                  haigh: 47,
                                  color: ColorManager.kPrimary,
                                  text: 'اطلب الحين',
                                  press: () {
                                    if (sharedPreferences
                                                .getString('access_token') ==
                                            'null' ||
                                        sharedPreferences
                                                .getString('access_token') ==
                                            null) {
                                      aleartToken(context);
                                    } else {
                                      controller.addCart(
                                        sharedPreferences.getString('id')!,
                                        controller.productDetalisModels
                                                ?.data![0].id
                                                .toString() ??
                                            '166',
                                        controller.count.toString(),
                                        context,
                                        isAlh7in: true,
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: 15),
                                CustomButton(
                                  width: 150,
                                  rectangel: 10,
                                  haigh: 47,
                                  fontSize: 18,
                                  color: ColorManager.white,
                                  colorText: ColorManager.kPrimary,
                                  sideIs:
                                      BorderSide(color: ColorManager.kPrimary),
                                  text: 'اضف للسلة',
                                  press: () {
                                    if (sharedPreferences
                                                .getString('access_token') ==
                                            'null' ||
                                        sharedPreferences
                                                .getString('access_token') ==
                                            null) {
                                      aleartToken(context);
                                    } else {
                                      controller.addCart(
                                        sharedPreferences.getString('id')!,
                                        controller.productDetalisModels
                                                ?.data![0].id
                                                .toString() ??
                                            '166',
                                        controller.count.toString(),
                                        context,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.translate(
                                  offset: Offset(20, 0),
                                  child: InkWell(
                                    onTap: () {
                                      if (sharedPreferences
                                                  .getString('access_token') ==
                                              'null' ||
                                          sharedPreferences
                                                  .getString('access_token') ==
                                              null) {
                                        aleartToken(context);
                                      } else {
                                        homecontroller.addFavorit(
                                          int.parse(sharedPreferences
                                              .getString('id')!),
                                          controller.productDetalisModels!
                                              .data![0].id!,
                                          context,
                                        );
                                      }
                                    },
                                    child: Text(
                                      'اضف الي قائمة الامنيات',
                                      style: MangeStyles().getBoldStyle(
                                        color: ColorManager.kPrimary,
                                        fontSize: FontSize.s18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    showDilog(
                                      context,
                                      'تم اضافة الي قائمة الامنيات بنجاح',
                                    );
                                  },
                                  child: Text(
                                    'أضف للمقارنة',
                                    style: MangeStyles().getBoldStyle(
                                      color: ColorManager.kPrimary,
                                      fontSize: FontSize.s18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TitelCard(
                        namecard: 'منتجات موصي بها',
                        onTap: () {
                          Get.toNamed(
                            Routes.moreproduct,
                            arguments: [15],
                          );
                        },
                      ),
                      Container(
                        height: 340,
                        child: GetBuilder<HomeController>(
                          builder: (controller) {
                            return HandlingDataView(
                              statusRequest: controller.statusRequest2,
                              widget: Container(
                                alignment: Alignment.center,
                                height: 325,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      controller.productModels?.data!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProductCard(
                                      margin: 13,
                                      dataProduct: controller
                                          .productModels?.data![index],
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TitelCard(
                        namecard: 'منتجات تم زيرتها مؤخرا',
                        onTap: () {
                          Get.toNamed(
                            Routes.moreproduct,
                            arguments: [15],
                          );
                        },
                      ),
                      GetBuilder<HomeController>(
                        builder: (controller) {
                          return HandlingDataView(
                            statusRequest: controller.statusRequest3,
                            widget: Container(
                              alignment: Alignment.center,
                              height: 325,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.productModels?.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductCard(
                                    margin: 13,
                                    dataProduct: controller
                                        .productModelsone?.data![index],
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TitelCard(
                        namecard: 'الجمال والعناية الشخصية',
                        onTap: () {
                          Get.toNamed(
                            Routes.moreproduct,
                            arguments: [6],
                          );
                        },
                      ),
                      GetBuilder<HomeController>(
                        builder: (controller) {
                          return HandlingDataView(
                            statusRequest: controller.statusRequest4,
                            widget: Container(
                              alignment: Alignment.center,
                              height: 325,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.productModels?.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductCard(
                                      margin: 13,
                                      dataProduct: controller
                                          .productModelstow?.data![index]);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 25),
                      //   child: Align(
                      //     alignment: Alignment.centerRight,
                      //     child: Text(
                      //       'الذهاب الي الاقسام',
                      //       style: MangeStyles().getRegularStyle(
                      //         color: ColorManager.kPrimary,
                      //         fontSize: FontSize.s18,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Wrap(
                      //   alignment: WrapAlignment.start,
                      //   children: [
                      //     for (int i = 0; i < catogeryTest.length; i++)
                      //       CustomButton(
                      //         width: 180,
                      //         rectangel: 10,
                      //         haigh: 47,
                      //         fontSize: 18,
                      //         color: ColorManager.white,
                      //         colorText: ColorManager.kPrimary,
                      //         sideIs: BorderSide(color: ColorManager.kPrimary),
                      //         text: catogeryTest[i].name,
                      //         press: () {
                      //           Get.toNamed(
                      //             Routes.moreproduct,
                      //             arguments: [catogeryTest[i].id],
                      //           );
                      //         },
                      //       ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
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
        future: controller.getConstantProductDetalis(Get.arguments[0]),
      ),
    );
  }
}

class CatogeryTest {
  final int id;
  final String name;

  CatogeryTest({required this.id, required this.name});
}

List<CatogeryTest> catogeryTest = [
  CatogeryTest(id: 7, name: 'الأزياء'),
  CatogeryTest(id: 8, name: 'المنزل والمطبخ'),
  CatogeryTest(id: 11, name: 'منتجات الأطفال'),
  CatogeryTest(id: 16, name: 'لوازم مكتبية'),
  CatogeryTest(id: 15, name: 'لوازم الحيوانات'),
  CatogeryTest(id: 17, name: 'الكتب'),
];
