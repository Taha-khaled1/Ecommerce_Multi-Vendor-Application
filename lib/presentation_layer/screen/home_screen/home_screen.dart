import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/cart_screen/cart_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/control_board_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/notification_list_screen/notification_list_screen.dart';
import 'package:pisti/presentation_layer/screen/favourite_screen/favourite_screen.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_controller/home_controller.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/alerttoken.dart';
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
      //  bottomNavigationBar: const BottomNavHomeScreen(),
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        actions: [
          Stack(
            children: [
              CircleButton(
                onTap: () {
                  if (sharedPreferences.getString('access_token') == 'null' ||
                      sharedPreferences.getString('access_token') == null) {
                    aleartToken(context);
                  } else {
                    Get.toNamed(Routes.cart);
                  }
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
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  width: deviceInfo.localWidth * 0.9,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/REO.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Text(
                    'الاقسام',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s20,
                    ),
                  ),
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest1,
                      widget: Container(
                        alignment: Alignment.center,
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.catogeryModels?.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return controller.catogeryModels?.data![index].id ==
                                    55
                                ? SizedBox()
                                : CatogeryCard(
                                    catogeryData:
                                        controller.catogeryModels?.data![index],
                                  );
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
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
                            itemCount: controller.productModels?.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                margin: 13,
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
                        height: 325,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.productModels?.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              margin: 13,
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
                        height: 325,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.productModels?.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                                margin: 13,
                                dataProduct:
                                    controller.productModelstow?.data![index]);
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <String>[
    'assets/icons/icons8-home.svg',
    'assets/icons/nL9xtA01.svg',
    'assets/icons/icons8-notification-50.svg',
    'assets/icons/user-6767.svg',
  ];
  final iconLisdt = <Widget>[
    HomeScreen(),
    FavouriteScreen(),
    NotificationListScreen(),
    ControlBoardScreen(),
  ];
  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#373A36'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        extendBody: true,
        body: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: iconLisdt[_bottomNavIndex],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff0E5FAA),
          child: Image.asset(
            'assets/icons/bag.png',
            color: Colors.white,
            height: 40,
            width: 40,
          ),
          onPressed: () {
            _fabAnimationController.reset();
            _borderRadiusAnimationController.reset();
            _borderRadiusAnimationController.forward();
            _fabAnimationController.forward();
            if (sharedPreferences.getString('access_token') == 'null' ||
                sharedPreferences.getString('access_token') == null) {
              aleartToken(context);
            } else {
              Get.to(CartScreen());
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? HexColor('#FFA400') : Colors.white;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconList[index],
                  height: 35,
                  width: 35,
                ),
                const SizedBox(height: 4),
              ],
            );
          },
          backgroundColor: Colors.white,
          activeIndex: _bottomNavIndex,
          splashColor: HexColor('#FFA400'),
          notchAndCornersAnimation: borderRadiusAnimation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {
            if (sharedPreferences.getString('access_token') == 'null' ||
                sharedPreferences.getString('access_token') == null &&
                    index != 0) {
              aleartToken(context);
            } else {
              setState(() => _bottomNavIndex = index);
            }
          },
          hideAnimationController: _hideBottomBarAnimationController,
          shadow: BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: HexColor('#FFA400'),
          ),
        ),
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  final IconData iconData;

  NavigationScreen(this.iconData) : super();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData != widget.iconData) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          SizedBox(height: 64),
          Text(
            'sssssssssssssssss',
            style: TextStyle(color: Colors.black, fontSize: 50),
          ),
          Text(
            'qqqqqqqqqqqqq',
            style: TextStyle(color: Colors.amber, fontSize: 50),
          ),
          Center(
            child: CircleAvatar(
              // animation: animation,
              // centerOffset: Offset(80, 80),
              maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
              child: Icon(
                widget.iconData,
                color: HexColor('#FFA400'),
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
