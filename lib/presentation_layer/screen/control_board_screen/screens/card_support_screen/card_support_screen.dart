import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pisti/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:pisti/presentation_layer/components/appbar1.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/resources/values_manager.dart';
import 'package:pisti/presentation_layer/screen/Shipping_info_screen/widget/addAdreesContainer.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/card_support_screen/widget/add_card.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_screen.dart';

class CardSupportScreen extends StatelessWidget {
  const CardSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navb(),
      backgroundColor: ColorManager.white,
      appBar: appbar(),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'بطاقة الدعم',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary,
                      fontSize: FontSize.s25,
                    ),
                  ),
                ),
                for (int i = 0; i < 2; i++)
                  Align(alignment: Alignment.center, child: PaymentCard()),
                AddAdreesContainer(
                  width: deviceInfo.localWidth,
                  text: 'قم بإنشاء تذكرة',
                  onTap: () {
                    addCard();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 170,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xff9368DD),
            Color(0xff483AAF),
          ],
        ),
        color: Color(0xff8E7EFB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 5,
            child: SvgPicture.asset('assets/images/visa_logo_small.svg'),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 20,
            child: Row(
              children: [
                Text(
                  '1842',
                  style: MangeStyles()
                      .getBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s20,
                      )
                      .copyWith(letterSpacing: 2),
                ),
                SizedBox(
                  width: 10,
                ),
                Points(),
                SizedBox(
                  width: 10,
                ),
                Points(),
                SizedBox(
                  width: 10,
                ),
                Points(),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Card holder',
                  textAlign: TextAlign.left,
                  style: MangeStyles()
                      .getRegularStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s16,
                      )
                      .copyWith(wordSpacing: 0, letterSpacing: 0),
                ),
                Text(
                  'KELLY OLIVER',
                  style: MangeStyles()
                      .getBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s18,
                      )
                      .copyWith(wordSpacing: 0, letterSpacing: 0),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: Column(
              children: [
                Text(
                  'Expires',
                  textAlign: TextAlign.left,
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s16,
                  ),
                ),
                Text(
                  '08/21',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Points extends StatelessWidget {
  const Points({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: Colors.white,
        ),
        SizedBox(
          width: 3,
        ),
        CircleAvatar(
          radius: 6,
          backgroundColor: Colors.white,
        ),
        SizedBox(
          width: 3,
        ),
        CircleAvatar(
          radius: 6,
          backgroundColor: Colors.white,
        ),
        SizedBox(
          width: 3,
        ),
        CircleAvatar(
          radius: 6,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}

class Card {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;

  Card({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  });
}
