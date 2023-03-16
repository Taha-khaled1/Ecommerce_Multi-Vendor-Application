import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class TitelCard extends StatelessWidget {
  const TitelCard({
    Key? key,
    required this.namecard,
    required this.onTap,
  }) : super(key: key);
  final String namecard;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            namecard,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kPrimary,
              fontSize: FontSize.s16,
            ),
          ),
          MaterialButton(
            color: ColorManager.kPrimary,
            onPressed: onTap,
            child: Text(
              'المزيد',
              style: MangeStyles().getRegularStyle(
                color: ColorManager.white,
                fontSize: FontSize.s14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
