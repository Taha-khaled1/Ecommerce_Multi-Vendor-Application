import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/control_board_controller/control_board_controller.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customListtile.dart';

class ProfilePersonlyScreen extends StatelessWidget {
  ProfilePersonlyScreen({super.key});
  String phone = sharedPreferences.getString('phone') == 'null'
      ? "لايوجد رقم هاتف"
      : sharedPreferences.getString('phone')!;
  String name = sharedPreferences.getString('name') == 'null'
      ? "لايوجد رقم هاتف"
      : sharedPreferences.getString('name')!;
  @override
  Widget build(BuildContext context) {
    ControlBoardController controller = Get.put(ControlBoardController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'حسابي',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s25,
                ),
              ),
            ),
            Column(
              children: [
                sharedPreferences.getString('avatar') == null ||
                        sharedPreferences.getString('avatar') == 'null'
                    ? CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/icons/person.jpg'),
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            '${sharedPreferences.getString('avatar')}'),
                      ),
                Text(
                  name,
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s25,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.editProfileRoute);
                  },
                  child: Text(
                    'تعديل الحساب',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.ktextlabny,
                      fontSize: FontSize.s22,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'معلومات شخصية',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextblack,
                  fontSize: FontSize.s25,
                ),
              ),
            ),
            Column(children: [
              ListTile(
                isThreeLine: true,
                leading: SvgPicture.asset(
                  'assets/icons/phone-call-svgrepo-com (2).svg',
                  // color: Colors.white,
                ),
                title: Text(
                  'رقم الهاتف',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s20,
                  ),
                ),
                subtitle: Text(
                  phone,
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextlightgray,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
              ListTile(
                isThreeLine: true,
                leading: SvgPicture.asset(
                  'assets/icons/envelope2.svg',
                  // color: Colors.white,
                ),
                title: Text(
                  'البريد الإلكتروني',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s20,
                  ),
                ),
                subtitle: Text(
                  sharedPreferences.getString('email') ?? 'gmail',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextlightgray,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.5,
            ),
            CustomListtile(
              image: 'assets/icons/log-out.svg',
              onTap: () {
                controller.logOut(context);
              },
              titel: 'تسجيل خروج',
            )
          ],
        ),
      ),
    );
  }
}

class ListtileModel2 {
  final String titel, subtitel, image;

  ListtileModel2(
      {required this.titel, required this.subtitel, required this.image});
}
