import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/domain_layer/models/product_models.dart';
import 'package:pisti/presentation_layer/components/onlyrating.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/onboarding_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.margin,
    this.dataProduct,
  }) : super(key: key);
  final DataProduct? dataProduct;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.productDetailsRoute,
          arguments: [dataProduct!.id ?? 6],
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
                    '${APiMange.baseurlImage}/${dataProduct?.thumbnailImage}',
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
                  child: CircleButton(
                    size: 36,
                    sizedsvg: 25,
                    color1: ColorManager.white,
                    onTap: () {},
                    iconData: 'assets/icons/heart.svg',
                    color2: ColorManager.kPrimary,
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
                      dataProduct?.name ?? 'noname',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.kTextblack,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    OnlyRating(nmuberstar: dataProduct?.rating ?? 5),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  dataProduct?.mainPrice ?? 'erorr',
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
