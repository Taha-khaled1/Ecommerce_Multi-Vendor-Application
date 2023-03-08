// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/control_board_controller/control_board_controller.dart';

import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customContainerBoard.dart';

class ControllerBoardWidget extends StatelessWidget {
  const ControllerBoardWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ControlBoardController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlBoardController>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest7,
          widget: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomContainerBoard(
                    color: ColorManager.containacolor1,
                    number: controller.countersModels?.cartItemCount! ?? 0,
                    subtitel: 'في عربة التسوق\n الخاصة بك',
                    titel: 'المنتج',
                  ),
                  CustomContainerBoard(
                    color: ColorManager.containacolor2,
                    number: controller.countersModels?.wishlistItemCount! ?? 0,
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
                number: controller.countersModels?.orderCount! ?? 0,
                subtitel: 'لقد طلبت',
                titel: 'المنتجات',
                opcty: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
