import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/control_board_controller/control_board_controller.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/allListtileControllerBoard.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/controllerBoardWidget.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customAppBarControllerProfile.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/register_shope.dart';

class ControlBoardScreen extends StatelessWidget {
  const ControlBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ControlBoardController controller = Get.put(ControlBoardController());
    return Scaffold(
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBarControllerProfile(deviceInfo: deviceInfo),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'لوحة القيادة',
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.kTextblack,
                        fontSize: FontSize.s22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ControllerBoardWidget(controller: controller),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'لوحة التحكم',
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.kTextblack,
                        fontSize: FontSize.s22,
                      ),
                    ),
                  ),
                ),
                AllListtileControllerBoard(controller: controller),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  width: deviceInfo.localWidth * 0.85,
                  haigh: 60,
                  color: ColorManager.kPrimary,
                  text: 'سجل متجرك',
                  press: () {
                    registerShope(controller: controller);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
