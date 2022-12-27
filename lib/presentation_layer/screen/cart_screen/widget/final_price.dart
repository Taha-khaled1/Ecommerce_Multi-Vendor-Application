import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class FinalPrice extends StatelessWidget {
  const FinalPrice({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);
  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: MangeStyles().getBoldStyle(
            color: ColorManager.kTextlightgray,
            fontSize: FontSize.s18,
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'AED',
            style: MangeStyles().getRegularStyle(
              color: ColorManager.kPrimary,
              fontSize: FontSize.s18,
            ),
            children: <TextSpan>[
              TextSpan(
                text: price,
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
