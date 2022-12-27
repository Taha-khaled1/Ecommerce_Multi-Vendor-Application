import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_controller/home_controller.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/bottomNavHomeScreen.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/catogery_card.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/product_card.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/search_bar.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/threetext.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/titelcard.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/onboarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      bottomNavigationBar: const BottomNavHomeScreen(),
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CircleAvatar(
            backgroundColor: ColorManager.backgroundpersonalimage,
            backgroundImage: const AssetImage('assets/images/Rectangle 13.png'),
          ),
        ),
        actions: [
          Stack(
            children: [
              CircleButton(
                onTap: () {
                  Get.toNamed(Routes.cart);
                },
                iconData: 'assets/icons/shopping-basket.svg',
                color1: ColorManager.grey2,
              ),
              Positioned(
                top: 10,
                right: 20,
                child: CircleAvatar(
                  radius: 4.2,
                  backgroundColor: ColorManager.error,
                ),
              )
            ],
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return ListView(
              children: [
                SearchBar(kBackgroundColor: ColorManager.grey2),
                const ThreeText(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: deviceInfo.localWidth * 0.9,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/REO.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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

                        return Container(
                          alignment: Alignment.center,
                          height: 140,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.catogeryModels?.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CatogeryCard(
                                catogeryData:
                                    controller.catogeryModels?.data![index],
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
                  future: controller.getAllcatogery(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TitelCard(
                  namecard: 'اكثر مبيعا',
                  onTap: () {
                    Get.toNamed(Routes.moreproduct);
                  },
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

                        return Container(
                          alignment: Alignment.center,
                          height: 325,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.productModels?.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                margin: 13,
                                dataProduct:
                                    controller.productModels?.data![index],
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
                  future: controller.getAllTopProduct(),
                ),
                TitelCard(
                  namecard: 'لوازم الحيوانات الأليفة',
                  onTap: () {
                    Get.toNamed(
                      Routes.moreproduct,
                      arguments: [15],
                    );
                  },
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

                        return Container(
                          alignment: Alignment.center,
                          height: 325,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.productModelsone?.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                margin: 13,
                                dataProduct:
                                    controller.productModelsone?.data![index],
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
                  future: controller.getConstantProductHomeone(15, 1),
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

                        return Container(
                          alignment: Alignment.center,
                          height: 325,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.productModelstow?.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                  margin: 13,
                                  dataProduct: controller
                                      .productModelstow?.data![index]);
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
                  future: controller.getConstantProductHomeTow(6, 1),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
