import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/domain_layer/models/catogery_models.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({
    Key? key,
    this.catogeryData,
  }) : super(key: key);
  final CatogeryData? catogeryData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.moreproduct,
          arguments: [catogeryData!.id ?? 6],
        );
      },
      child: SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.network(
                  '${APiMange.baseurlImage}/${catogeryData?.icon ?? 'icon'}',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/cat1.png');
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: Text(
                  catogeryData?.name ?? 'name',
                  textAlign: TextAlign.center,
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s14,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
