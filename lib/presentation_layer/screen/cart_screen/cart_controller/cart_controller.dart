import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/domain_layer/models/cart_list_models.dart';

class CartController extends GetxController {
  CartListModels? cartListModels;
  List<CartListModels> carModelsdemo = [];
  getCartList(int idCato) async {
    carModelsdemo.clear();
    try {
      var response = await getCartListRes(idCato);

      for (var i = 0; i < response.length; i++) {
        cartListModels = await CartListModels.fromJson(response[i]);

        carModelsdemo.add(cartListModels!);
      }

      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 'error';
    }
  }
}
