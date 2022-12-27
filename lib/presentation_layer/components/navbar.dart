import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';

class BottomNavAuth extends StatelessWidget {
  const BottomNavAuth({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return SizedBox(
          height: 110,
          child: Column(
            children: [
              CustomButton(
                width: deviceInfo.localWidth * 0.85,
                haigh: 60,
                color: ColorManager.kPrimary,
                text: text,
                press: press,
              ),
            ],
          ),
        );
      },
    );
  }
}
