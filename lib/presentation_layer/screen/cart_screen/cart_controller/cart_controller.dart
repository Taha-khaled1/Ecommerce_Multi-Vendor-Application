import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/domain_layer/models/cart_list_models.dart';

class CartController extends GetxController {
  double totelPrice = 0;
  double totelTex = 0;
  int count = 0;
  CartListModels? cartListModels;
  List<CartItems> carModelsdemo = [];
  getCartList(int idCato) async {
    carModelsdemo.clear();
    totelPrice = 0;
    totelTex = 0;
    try {
      var response = await getCartListRes(idCato);

      for (var i = 0; i < response.length; i++) {
        cartListModels = await CartListModels.fromJson(response[i]);
        for (int q = 0; q < cartListModels!.cartItems!.length; q++) {
          totelPrice += cartListModels!.cartItems![q].price!.toDouble() *
              cartListModels!.cartItems![q].quantity!.toDouble();
          totelTex += cartListModels!.cartItems![q].tax!.toDouble() *
              cartListModels!.cartItems![q].quantity!.toDouble();
          carModelsdemo.add(cartListModels!.cartItems![q]);
        }
      }
      update();
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 'error';
    }
  }

  icrasingCount(int count, double price) {
    count++;
    totelPrice += price;
    update();
  }

  decrasingCount(int count, double price) {
    if (count > 1) {
      count--;
      totelPrice -= price;
      update();
    }
  }
}
