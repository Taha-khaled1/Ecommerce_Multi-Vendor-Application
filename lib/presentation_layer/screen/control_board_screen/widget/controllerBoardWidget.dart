// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';

import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customContainerBoard.dart';

class ControllerBoardWidget extends StatelessWidget {
  const ControllerBoardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomContainerBoard(
              color: ColorManager.containacolor1,
              number: 0,
              subtitel: 'في عربة التسوق\n الخاصة بك',
              titel: 'المنتج',
            ),
            CustomContainerBoard(
              color: ColorManager.containacolor2,
              number: 0,
              subtitel: 'في قائمة الرغبات\n الخاصة بك',
              titel: 'المنتجات',
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        CustomContainerBoard(
          color: ColorManager.containacolor3,
          number: 0,
          subtitel: 'لقد طلبت',
          titel: 'المنتجات',
          opcty: 1,
        ),
      ],
    );
  }
}
