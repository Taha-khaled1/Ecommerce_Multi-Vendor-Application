import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class ThreeText extends StatelessWidget {
  const ThreeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              'عروض',
              style: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextlightgray, fontSize: FontSize.s14),
            )),
        TextButton(
          onPressed: () {},
          child: Text(
            'ما الجديد',
            style: MangeStyles().getBoldStyle(
                color: ColorManager.kTextlightgray, fontSize: FontSize.s14),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'اكثر مبيعا',
              style: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextlightgray, fontSize: FontSize.s14),
            ))
      ],
    );
  }
}
