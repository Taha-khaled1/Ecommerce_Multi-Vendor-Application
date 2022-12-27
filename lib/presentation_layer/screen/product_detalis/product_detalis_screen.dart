import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/onlyrating.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/product_detalis/product_detalis_controller/product_detalis_controller.dart';
import 'package:pisti/presentation_layer/screen/product_detalis/widget/iIncrasing_or_decrasing.dart';

class ProductDetalisScreen extends StatelessWidget {
  const ProductDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    final ProductDetalisController controller =
        Get.put(ProductDetalisController());
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
                child: Column(
                  children: [
                    Container(
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListView(
                          children: [
                            Text(
                              controller.productDetalisModels?.data![0].name ??
                                  'name',
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.kTextblack,
                                fontSize: FontSize.s20,
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
                            RichText(
                              text: TextSpan(
                                text: 'تم بيعها من قبل :',
                                style: MangeStyles().getRegularStyle(
                                  color: ColorManager.kTextblack,
                                  fontSize: FontSize.s14,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: controller
                                        .productDetalisModels?.data![0].addedBy,
                                    style: MangeStyles().getRegularStyle(
                                      color: ColorManager.kPrimary,
                                      fontSize: FontSize.s14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const OnlyRating(nmuberstar: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IncrasingorDecrasing(
                                  fontsize: AppSize.s32,
                                  size: 40,
                                  onTapAdd: () {},
                                  onTapmuns: () {},
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
                                  press: () {},
                                ),
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
                                  press: () {},
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'أضف الى قائمة الامنيات',
                                    style: MangeStyles().getBoldStyle(
                                      color: ColorManager.kPrimary,
                                      fontSize: FontSize.s14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'أضف للمقارنة',
                                      style: MangeStyles().getBoldStyle(
                                        color: ColorManager.kPrimary,
                                        fontSize: FontSize.s14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
