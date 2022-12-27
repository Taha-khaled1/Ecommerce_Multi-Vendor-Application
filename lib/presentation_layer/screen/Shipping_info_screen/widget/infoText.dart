// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);
  final String title, info;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title :',
        style: MangeStyles().getBoldStyle(
          color: ColorManager.kTextlightgray,
          fontSize: FontSize.s20,
        ),
        children: <TextSpan>[
          TextSpan(
            text: info,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kPrimary,
              fontSize: FontSize.s22,
            ),
          ),
        ],
      ),
    );
  }
}
