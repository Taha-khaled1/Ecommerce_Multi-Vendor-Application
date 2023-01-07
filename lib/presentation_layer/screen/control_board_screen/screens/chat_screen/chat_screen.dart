import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'المحادثات',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s25,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatCard(
                        onTap: () {
                          //   Get.to(ChatPage());
                        },
                      );
                    },
                  ),
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

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 120,
          decoration: BoxDecoration(
            color: ColorManager.white,
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/images/Rectangle 33.png',
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: 'Alexandero\n',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'شكرا  على ثقتك❤❤',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kTextlightgray,
                        fontSize: FontSize.s16,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                'Dec 02, 2022',
                style: MangeStyles().getRegularStyle(
                  color: ColorManager.kTextlightgray,
                  fontSize: FontSize.s18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
