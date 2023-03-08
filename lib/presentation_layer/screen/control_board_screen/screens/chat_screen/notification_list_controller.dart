import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class ChateScreen extends StatelessWidget {
  const ChateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      body: 1 == 2
          ? Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'المحادثات',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage('assets/images/Rectangle 29.png'),
                          ),
                          title: Text(
                            'قام Hammad باضافة منتجك الى قائمة الرغبات. قام Hammad باضافة منتجك الى قائمة الرغبات.',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextlightgray,
                              fontSize: FontSize.s16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'قائمة الاشعارات',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s25,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                Center(
                  child: Text(
                    'لا يوجد اي محادثات الان',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s20,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
