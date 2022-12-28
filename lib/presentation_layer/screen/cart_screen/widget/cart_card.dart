import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pisti/domain_layer/models/cart_list_models.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/product_detalis/widget/iIncrasing_or_decrasing.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    this.index,
    this.cart,
  }) : super(key: key);
  final CartItems? cart;

  final int? index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: const EdgeInsets.all((10)),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  '${APiMange.baseurlImage}/${cart?.productThumbnailImage}',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/Rectangle 19.png');
                  },
                  width: 200,
                  height: 210,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart?.productName ?? 'name',
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              RichText(
                text: TextSpan(
                  text: 'السعر :',
                  style: MangeStyles().getRegularStyle(
                    color: ColorManager.kTextlightgray,
                    fontSize: FontSize.s14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'AED',
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    TextSpan(
                      text: cart?.price.toString() ?? '00',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s16,
                      ),
                    ),
                  ],
                ),
              ),
              IncrasingorDecrasing(
                fontsize: 25,
                count: 1,
                size: 30,
                onTapAdd: () {},
                onTapmuns: () {},
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/trash.svg'),
          )
        ],
      ),
    );
  }
}
