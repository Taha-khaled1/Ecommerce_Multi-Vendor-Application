import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/cart_screen/cart_screen.dart';
import 'package:pisti/presentation_layer/screen/catogery_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/control_board_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/notification_list_screen/notification_list_screen.dart';
import 'package:pisti/presentation_layer/screen/favourite_screen/favourite_screen.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_controller/home_controller.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/alerttoken.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/catogery_card.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/product_card.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/search_bar.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/titelcard.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> xitem = [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/REO.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    ];
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: Navb(),
      backgroundColor: ColorManager.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return ListView(
              children: [
                const SizedBox(
                  height: 5,
                ),
                SearchBar(kBackgroundColor: ColorManager.grey2),
                // const ThreeText(),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 225,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CarouselSlider(
                      items: xitem,
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      )),
                  // child: Carousel(
                  //   images: [
                  //     NetworkImage(
                  //         'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                  //     NetworkImage(
                  //         'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                  //     ExactAssetImage("assets/images/REO.png")
                  //   ],
                  // ),
                ),

                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                //   child: Text(
                //     'الاقسام',
                //     style: MangeStyles().getBoldStyle(
                //       color: ColorManager.kPrimary,
                //       fontSize: FontSize.s20,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 5,
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    int x = controller.catogeryModels?.data?.length ?? 0;
                    int p = x ~/ 2;

                    return HandlingDataView(
                      statusRequest: controller.statusRequest1,
                      widget: Container(
                        alignment: Alignment.center,
                        height: 325,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: p, //14
                          itemBuilder: (BuildContext context, int index) {
                            final itemIndex = index + 5;
                            return controller.catogeryModels?.data![index].id ==
                                    55
                                ? SizedBox()
                                : Column(
                                    children: [
                                      CatogeryCard(
                                        catogeryData: controller
                                            .catogeryModels?.data![index],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CatogeryCard(
                                        catogeryData: controller
                                            .catogeryModels?.data![itemIndex],
                                      ),
                                    ],
                                  );
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TitelCard(
                  namecard: 'اكثر مبيعا',
                  onTap: () {
                    Get.toNamed(
                      Routes.moreproduct,
                      arguments: [15],
                    );
                  },
                ),
                Container(
                  height: 315,
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return HandlingDataView(
                        statusRequest: controller.statusRequest2,
                        widget: Container(
                          alignment: Alignment.center,
                          height: 315,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.productModels?.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                margin: 10,
                                dataProduct:
                                    controller.productModels?.data![index],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
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
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest3,
                      widget: Container(
                        alignment: Alignment.center,
                        height: 315,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.productModels?.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              margin: 10,
                              dataProduct:
                                  controller.productModelsone?.data![index],
                            );
                          },
                        ),
                      ),
                    );
                  },
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
                        height: 315,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.productModels?.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                                margin: 10,
                                dataProduct:
                                    controller.productModelstow?.data![index]);
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Navb extends StatelessWidget {
  const Navb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIcon(
            svg: 'assets/icons/icons8-home.svg',
            title: 'الرئيسيه',
            onTap: () {
              Get.toNamed(Routes.homeRoute);
            },
          ),
          CustomIcon(
            svg: 'assets/images/menu.svg',
            title: 'التصنيفات',
            onTap: () {
              Get.off(() => CatogeryScreen());
            },
          ),
          CustomIcon(
            svg: 'assets/icons/sh.svg',
            title: 'عربة التسوق',
            onTap: () {
              if (sharedPreferences.getString('access_token') == 'null' ||
                  sharedPreferences.getString('access_token') == null) {
                aleartToken(context);
              } else {
                Get.to(() => CartScreen());
              }
            },
          ),
          CustomIcon(
            svg: 'assets/icons/icons8-notification-50.svg',
            title: 'الاشعارات',
            onTap: () {
              if (sharedPreferences.getString('access_token') == 'null' ||
                  sharedPreferences.getString('access_token') == null) {
                aleartToken(context);
              } else {
                Get.to(() => NotificationListScreen());
              }
            },
          ),
          CustomIcon(
              svg: 'assets/icons/user-6767.svg',
              title: 'الحساب',
              onTap: () {
                if (sharedPreferences.getString('access_token') == 'null' ||
                    sharedPreferences.getString('access_token') == null) {
                  aleartToken(context);
                } else {
                  Get.to(() => ControlBoardScreen());
                }
              }),
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key, required this.svg, required this.title, required this.onTap});
  final String svg, title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svg,
            width: 30,
            height: 30,
          ),
          Text(title)
        ],
      ),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   // final autoSizeGroup = AutoSizeGroup();
//   var _bottomNavIndex = 0; //default index of a first screen

//   final iconList = <String>[
//     'assets/icons/icons8-home.svg',
//     'assets/icons/nL9xtA01.svg',
//     'assets/icons/icons8-notification-50.svg',
//     'assets/icons/user-6767.svg',
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData.dark(),
//       child: Scaffold(
//         extendBody: true,
//         body: NotificationListener<ScrollNotification>(
//           // onNotification: onScrollNotification,
//           child: iconLisdt[_bottomNavIndex],
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Color(0xff0E5FAA),
//           child: Image.asset(
//             'assets/icons/bag.png',
//             color: Colors.white,
//             height: 40,
//             width: 40,
//           ),
//           onPressed: () {
//             if (sharedPreferences.getString('access_token') == 'null' ||
//                 sharedPreferences.getString('access_token') == null) {
//               aleartToken(context);
//             } else {
//               Get.to(CartScreen());
//             }
//           },
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//           itemCount: iconList.length,
//           tabBuilder: (int index, bool isActive) {
//             final color = isActive ? HexColor('#FFA400') : Colors.white;
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   iconList[index],
//                   height: 35,
//                   width: 35,
//                 ),
//                 const SizedBox(height: 4),
//               ],
//             );
//           },
//           backgroundColor: Colors.white,
//           activeIndex: _bottomNavIndex,
//           splashColor: HexColor('#FFA400'),
//           //  notchAndCornersAnimation: borderRadiusAnimation,
//           splashSpeedInMilliseconds: 300,
//           notchSmoothness: NotchSmoothness.defaultEdge,
//           gapLocation: GapLocation.center,
//           leftCornerRadius: 32,
//           rightCornerRadius: 32,
//           onTap: (index) {
//             if (sharedPreferences.getString('access_token') == 'null' ||
//                 sharedPreferences.getString('access_token') == null &&
//                     index != 0) {
//               aleartToken(context);
//             } else {
//               setState(() => _bottomNavIndex = index);
//             }
//           },
//           //   hideAnimationController: _hideBottomBarAnimationController,
//           shadow: BoxShadow(
//             offset: Offset(0, 1),
//             blurRadius: 12,
//             spreadRadius: 0.5,
//             color: HexColor('#FFA400'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //assets/images/menu.png
// class NavigationScreen extends StatefulWidget {
//   final IconData iconData;

//   NavigationScreen(this.iconData) : super();

//   @override
//   _NavigationScreenState createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> animation;

//   @override
//   void didUpdateWidget(NavigationScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.iconData != widget.iconData) {
//       _startAnimation();
//     }
//   }

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//     super.initState();
//   }

//   _startAnimation() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: ListView(
//         children: [
//           SizedBox(height: 64),
//           Text(
//             'sssssssssssssssss',
//             style: TextStyle(color: Colors.black, fontSize: 50),
//           ),
//           Text(
//             'qqqqqqqqqqqqq',
//             style: TextStyle(color: Colors.amber, fontSize: 50),
//           ),
//           Center(
//             child: CircleAvatar(
//               // animation: animation,
//               // centerOffset: Offset(80, 80),
//               maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
//               child: Icon(
//                 widget.iconData,
//                 color: HexColor('#FFA400'),
//                 size: 10,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
