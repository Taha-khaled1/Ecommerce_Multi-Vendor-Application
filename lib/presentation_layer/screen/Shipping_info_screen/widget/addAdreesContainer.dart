// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class AddAdreesContainer extends StatelessWidget {
  const AddAdreesContainer({
    Key? key,
    required this.width,
    this.onTap,
    required this.text,
  }) : super(key: key);
  final double width;
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        width: width,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorManager.grey2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              size: 60,
            ),
            Text(
              text,
              style: MangeStyles().getRegularStyle(
                color: ColorManager.kTextblack,
                fontSize: FontSize.s22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
