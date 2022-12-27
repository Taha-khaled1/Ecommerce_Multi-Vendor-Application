// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/product_detalis/widget/button_change.dart';

class IncrasingorDecrasing extends StatelessWidget {
  const IncrasingorDecrasing({
    super.key,
    required this.size,
    this.onTapAdd,
    this.onTapmuns,
    required this.fontsize,
  });
  final double size;
  final void Function()? onTapAdd;
  final void Function()? onTapmuns;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonChange(
          size: size,
          icon: Icons.add,
          x: true,
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '1',
            style: MangeStyles().getRegularStyle(
              color: ColorManager.kTextblack,
              fontSize: fontsize,
            ),
          ),
        ),
        ButtonChange(
          size: size,
          icon: Icons.minimize,
          onTap: () {},
        ),
      ],
    );
  }
}
