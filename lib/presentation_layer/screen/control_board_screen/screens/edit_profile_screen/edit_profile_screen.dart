import 'package:flutter/material.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
              ),
              child: ListView(
                shrinkWrap: false,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'تعديل الحساب',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s25,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          const AssetImage('assets/images/Ellipse 1.png'),
                      child: Transform.translate(
                        offset: const Offset(40, 50),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(Icons.edit_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1.2,
                  ),
                  Text(
                    'الاسم واللقب',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextlightgray,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  CustomTextfeild(
                    inialvalue: 'Hacen Boudebbane',
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'ادخل هنا',
                    width: deviceInfo.localWidth * 0.85,
                    height: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'رقم الهاتف',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextlightgray,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  CustomTextfeild(
                    inialvalue: '+96658655854',
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'ادخل هنا',
                    width: deviceInfo.localWidth * 0.85,
                    height: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'البريد الإلكتروني',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextlightgray,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  CustomTextfeild(
                    inialvalue: 'Hacen.design@gmail.com',
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'ادخل هنا',
                    width: deviceInfo.localWidth * 0.85,
                    height: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'طريقة الدفع',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextlightgray,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  const Editpay(),
                  const SizedBox(height: 10),
                  Text(
                    'عنوان المنزل',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextlightgray,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  CustomTextfeild(
                    isBoarder: BorderStyle.none,
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'Abudabhi 201,82299 ابوظبي',
                    width: deviceInfo.localWidth * 0.85,
                    height: 70,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    width: deviceInfo.localWidth,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: 'حفظ',
                    press: () {},
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Editpay extends StatelessWidget {
  const Editpay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        children: [
          Image.asset('assets/images/payedit.png'),
          const SizedBox(
            width: 15,
          ),
          Text(
            'Stc Pay',
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s22,
            ),
          ),
          const Expanded(child: SizedBox()),
          TextButton(
            onPressed: () {},
            child: Text(
              'تعديل',
              style: MangeStyles().getBoldStyle(
                color: ColorManager.ktextlabny,
                fontSize: FontSize.s18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
