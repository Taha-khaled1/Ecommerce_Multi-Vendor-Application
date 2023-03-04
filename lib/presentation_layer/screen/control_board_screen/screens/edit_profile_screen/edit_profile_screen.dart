import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisti/application_layer/ShardFunction/handling.dart';
import 'package:pisti/application_layer/ShardFunction/statusrequst.dart';
import 'package:pisti/application_layer/ShardFunction/valid.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/main.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/custombutten.dart';
import 'package:pisti/presentation_layer/components/customtextfild.dart';
import 'package:pisti/presentation_layer/components/show_dialog.dart';
import 'package:pisti/presentation_layer/handlingView/handlingview.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/widget/customListtile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  StatusRequest statusRequest1 = StatusRequest.none;
  String? name, phone;
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
              child: Form(
                key: formkeysigin,
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
                      child: sharedPreferences.getString('avatar') == null ||
                              sharedPreferences.getString('avatar') == 'null'
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  AssetImage('assets/icons/person.jpg'),
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
                            )
                          : CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  '${sharedPreferences.getString('avatar')}'),
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
                      inialvalue: sharedPreferences.getString('name'),
                      valid: (p0) {
                        return validInput(p0.toString(), 1, 100, 'type');
                      },
                      onsaved: (p0) {
                        return name = p0.toString();
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
                      inialvalue: sharedPreferences.getString('phone') == 'null'
                          ? 'لايوجد رقم هاتف'
                          : sharedPreferences.getString('phone')!,
                      valid: (p0) {
                        return validInput(p0.toString(), 1, 100, 'type');
                      },
                      onsaved: (p0) {
                        return phone = p0.toString();
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
                    Editpay(size: 1),
                    const SizedBox(height: 10),
                    Text(
                      'عنوان المنزل',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kTextlightgray,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    CustomTextfeild(
                      readOnly: true,
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
                    HandlingDataView(
                      statusRequest: statusRequest1,
                      widget: CustomButton(
                        width: deviceInfo.localWidth,
                        haigh: 60,
                        color: ColorManager.kPrimary,
                        text: 'حفظ',
                        press: () async {
                          if (formkeysigin.currentState!.validate()) {
                            formkeysigin.currentState!.save();

                            statusRequest1 = StatusRequest.loading;
                            setState(() {});
                            var respon = await cahngeProfileRes(name!, phone!);
                            statusRequest1 = handlingData(respon);
                            try {
                              if (StatusRequest.success == statusRequest1) {
                                statusRequest1 = StatusRequest.none;
                                sharedPreferences.setString(
                                    'phone', phone.toString());

                                sharedPreferences.setString(
                                    'name', name.toString());
                                Get.back();
                                Get.back();
                                showDilog(context, 'تم تغير المعلومات بنجاح');
                              } else {
                                statusRequest1 = StatusRequest.serverfailure;
                              }
                            } catch (e) {
                              statusRequest1 = StatusRequest.erorr;
                            }

                            setState(() {});
                          }
                        },
                      ),
                    )
                  ],
                ),
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
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size),
          child: Container(
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/credit-card.png',
                  width: 55,
                  height: 45,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  controller.pay,
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s22,
                  ),
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: () {
                    handleAttachmentPressed(context, controller);
                  },
                  child: Text(
                    'تعديل',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String x = '';
void handleAttachmentPressed(
    BuildContext context, EditProfileController controller) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) => SafeArea(
      child: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomListtile(
              // color: ColorManager.ktextblackk,
              widget: Image.asset('assets/icons/bank.png'),
              onTap: () async {
                controller.changepay('تحويل بنكي');
              },
              titel: 'تحويل بنكي',
            ),
            CustomListtile(
              widget: Image.asset('assets/icons/visa.png'),
              onTap: () {
                controller.changepay('فيزا كارد');
              },
              titel: 'فيزا كارد',
            ),
            CustomListtile(
              widget: const Icon(
                Icons.attach_money,
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                controller.changepay('تحويل رقمي');
              },
              titel: 'تحويل رقمي',
            ),
          ],
        ),
      ),
    ),
  );
}
