import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/components/navbar.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      bottomNavigationBar: BottomNavAuth(
        press: () {
          //  Get.toNamed(Routes.shippingInfoRoute,arguments: {'cart':true});
        },
        text: 'حفظ',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'عنوان جديد',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s25,
                ),
              ),
            ),
            const AllFieldAddress()
          ],
        ),
      ),
    );
  }
}

class AllFieldAddress extends StatelessWidget {
  const AllFieldAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'عنوانك',
              hintStyle: MangeStyles().getBoldStyle(
                color: ColorManager.kTextlightgray,
                fontSize: FontSize.s22,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: PopupMenuButton(
                icon: SvgPicture.asset('assets/icons/Polygon 2.svg'),
                onSelected: (value) {},
                itemBuilder: (context) {
                  return const <PopupMenuItem<String>>[
                    PopupMenuItem<String>(value: 'Doge', child: Text('Doge')),
                    PopupMenuItem<String>(value: 'Lion', child: Text('Lion')),
                  ];
                },
              ),
              hintText: 'اختر بلدك',
              hintStyle: MangeStyles().getBoldStyle(
                color: ColorManager.kTextlightgray,
                fontSize: FontSize.s22,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: PopupMenuButton(
                icon: SvgPicture.asset('assets/icons/Polygon 2.svg'),
                onSelected: (value) {},
                itemBuilder: (context) {
                  return const <PopupMenuItem<String>>[
                    PopupMenuItem<String>(value: 'Doge', child: Text('Doge')),
                    PopupMenuItem<String>(value: 'Lion', child: Text('Lion')),
                  ];
                },
              ),
              hintText: 'المحافظة',
              hintStyle: MangeStyles().getBoldStyle(
                color: ColorManager.kTextlightgray,
                fontSize: FontSize.s22,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: PopupMenuButton(
                icon: SvgPicture.asset('assets/icons/Polygon 2.svg'),
                onSelected: (value) {},
                itemBuilder: (context) {
                  return const <PopupMenuItem<String>>[
                    PopupMenuItem<String>(value: 'Doge', child: Text('Doge')),
                    PopupMenuItem<String>(value: 'Lion', child: Text('Lion')),
                  ];
                },
              ),
              hintText: 'مدينة',
              hintStyle: MangeStyles().getBoldStyle(
                color: ColorManager.kTextlightgray,
                fontSize: FontSize.s22,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'رمزك البريدي',
              hintStyle: MangeStyles().getBoldStyle(
                color: ColorManager.kTextlightgray,
                fontSize: FontSize.s22,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'رقم هاتفك',
              hintStyle: MangeStyles().getBoldStyle(
                color: ColorManager.kTextlightgray,
                fontSize: FontSize.s22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
