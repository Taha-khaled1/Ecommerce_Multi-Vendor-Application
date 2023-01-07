// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pisti/main.dart';
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
    return FutureBuilder(
      builder: (ctx, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object

            return Column(
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
                      number:
                          controller.countersModels?.wishlistItemCount! ?? 0,
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
            );
          }
        }

        // Displaying LoadingSpinner to indicate waiting state
        return Center(
          child: CircularProgressIndicator(),
        );
      },

      // Future that needs to be resolved
      // inorder to display something on the Canvas
      future: controller.getCounters(
        int.parse(
          sharedPreferences.getString('id').toString(),
        ),
      ),
    );
  }
}
