import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pisti/domain_layer/models/cart_list_models.dart';
import 'package:pisti/presentation_layer/resources/color_manager.dart';
import 'package:pisti/presentation_layer/resources/font_manager.dart';
import 'package:pisti/presentation_layer/resources/msnge_api.dart';
import 'package:pisti/presentation_layer/resources/styles_manager.dart';
import 'package:pisti/presentation_layer/screen/cart_screen/cart_controller/cart_controller.dart';
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
    CartController cartController = Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
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
              SizedBox(
                width: 200,
                child: Text(
                  cart?.productName ?? 'name', textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
              GetBuilder<CartController>(
                builder: (controller) {
                  return IncrasingorDecrasing(
                    fontsize: 25,
                    count: cart!.quantity!,
                    size: 30,
                    onTapAdd: () {
                      cart!.quantity = cart!.quantity! + 1;
                      print(cart!.quantity);
                      controller.icrasingCount(
                        cart!.quantity!,
                        cart!.price!.toDouble(),
                      );
                    },
                    onTapmuns: () {
                      if (cart!.quantity!.toInt() > 1) {
                        cart!.quantity = cart!.quantity! - 1;
                      }
                      controller.decrasingCount(
                        cart!.quantity!,
                        cart!.price!.toDouble(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {
              cartController.deletecarts(context, cart!.id ?? 1);
            },
            icon: SvgPicture.asset('assets/icons/trash.svg'),
          )
        ],
      ),
    );
  }
}
