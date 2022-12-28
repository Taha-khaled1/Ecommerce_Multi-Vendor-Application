import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/domain_layer/models/favorite_models.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/onlyrating.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/login_screen/login_controller/login_controller.dart';
import 'package:pisti/presentation_layer/screen/favourite_screen/favourite_controller/favourite_controller.dart';
import 'package:pisti/presentation_layer/screen/home_screen/widget/product_card.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/onboarding_screen.dart';
import 'package:pisti/presentation_layer/screen/more_product/more_product.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavouriteController controller = Get.put(FavouriteController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'قائمة الرغبات',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s25,
                    ),
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

                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: getChildAspectRatio(deviceInfo),
                          ),
                          itemCount: controller.favoriteModels?.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCardFavorite(
                              dataProduct:
                                  controller.favoriteModels?.data![index],
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
                future: controller.getFavorit(
                  int.parse(
                    sharedPreferences.getString('id').toString(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProductCardFavorite extends StatelessWidget {
  const ProductCardFavorite({
    Key? key,
    this.margin,
    this.dataProduct,
  }) : super(key: key);
  final Data? dataProduct;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.productDetailsRoute,
          arguments: [dataProduct?.product!.id ?? 6],
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: margin ?? 0),
        width: 240,
        height: 155,
        decoration: BoxDecoration(
          color: ColorManager.grey2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    '${APiMange.baseurlImage}/${dataProduct?.product!.thumbnailImage}',
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/Rectangle 19.png');
                    },
                    width: 200,
                    height: 210,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: GetBuilder<FavouriteController>(
                    builder: (controller) {
                      bool x = false;
                      return CircleButton(
                        size: 36,
                        sizedsvg: 25,
                        color1: ColorManager.white,
                        onTap: () {
                          // x == true;
                          // sharedPreferences.getString('id') != null
                          //     ? controller.addFavorit(
                          //         int.parse(sharedPreferences
                          //             .getString('id')
                          //             .toString()),
                          //         dataProduct!.id!)
                          //     : customSnackBar('يجب تسجيل الدخول اولا');
                        },
                        iconData: 'assets/icons/heart.svg',
                        color2: x == false
                            ? ColorManager.kPrimary
                            : ColorManager.error,
                      );
                      // return HandlingDataView(
                      //   statusRequest: controller.statusRequest,
                      //   widget: CircleButton(
                      //     size: 36,
                      //     sizedsvg: 25,
                      //     color1: ColorManager.white,
                      //     onTap: () {
                      //       x == true;
                      //       sharedPreferences.getString('id') != null
                      //           ? controller.addFavorit(
                      //               int.parse(sharedPreferences
                      //                   .getString('id')
                      //                   .toString()),
                      //               dataProduct!.id!)
                      //           : customSnackBar('يجب تسجيل الدخول اولا');
                      //     },
                      //     iconData: 'assets/icons/heart.svg',
                      //     color2: x == false
                      //         ? ColorManager.kPrimary
                      //         : ColorManager.error,
                      //   ),
                      // );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dataProduct?.product!.name ?? 'noname',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.kTextblack,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    OnlyRating(nmuberstar: dataProduct?.product!.rating ?? 5),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  dataProduct?.product!.basePrice ?? 'erorr',
                  textAlign: TextAlign.center,
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
