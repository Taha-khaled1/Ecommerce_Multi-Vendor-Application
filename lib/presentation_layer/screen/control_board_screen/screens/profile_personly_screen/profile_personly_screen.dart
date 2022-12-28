import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customListtile.dart';

class ProfilePersonlyScreen extends StatelessWidget {
  const ProfilePersonlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/Ellipse 1.png'),
                ),
                Text(
                  sharedPreferences.getString('name')!,
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
            Column(
              children: List.generate(
                3,
                (index) => ListTile(
                  isThreeLine: true,
                  leading: SvgPicture.asset(
                    listtileModel2[index].image,
                    // color: Colors.white,
                  ),
                  title: Text(
                    listtileModel2[index].titel,
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  subtitle: Text(
                    listtileModel2[index].subtitel,
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextlightgray,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.5,
            ),
            CustomListtile(
              image: 'assets/icons/log-out.svg',
              onTap: () {},
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

List<ListtileModel2> listtileModel2 = [
  ListtileModel2(
    titel: 'رقم الهاتف',
    subtitel: sharedPreferences.getString('phone') ?? '011',
    image: 'assets/icons/phone-call-svgrepo-com (2).svg',
  ),
  ListtileModel2(
    titel: 'البريد الإلكتروني',
    subtitel: sharedPreferences.getString('email') ?? 'gmail.com',
    image: 'assets/icons/envelope2.svg',
  ),
  ListtileModel2(
    titel: 'عنوان المنزل',
    subtitel: 'Abudabhi 201,82299 ابوظبي',
    image: 'assets/icons/home22.svg',
  ),
];
