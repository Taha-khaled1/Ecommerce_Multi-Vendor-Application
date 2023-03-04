// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/Infowidget/models/device_info.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class CustomAppBarControllerProfile extends StatelessWidget {
  const CustomAppBarControllerProfile({
    Key? key,
    required this.deviceInfo,
    required this.x,
  }) : super(key: key);
  final DeviceInfo deviceInfo;
  final bool x;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.center,
              height: 155,
              width: deviceInfo.localWidth,
              color: ColorManager.controlercolor,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: sharedPreferences.getString('avatar') == null ||
                          sharedPreferences.getString('avatar') == 'null'
                      ? Image.asset('assets/icons/person.jpg')
                      : Image.network(sharedPreferences.getString('avatar')!),
                ),
                title: Text(
                  sharedPreferences.getString('name') ?? 'name',
                  style: MangeStyles()
                      .getBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s20,
                      )
                      .copyWith(height: 0.4),
                ),
                subtitle: Text(
                  sharedPreferences.getString('email') ?? 'email',
                  style: MangeStyles()
                      .getRegularStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s18,
                      )
                      .copyWith(height: 0.4),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 60,
              width: deviceInfo.localWidth * 0.85,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SwitchListTile(
                activeColor: ColorManager.switchcolor,
                title: Text(
                  'وضع البائع',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s18,
                  ),
                ),
                value: x,
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
