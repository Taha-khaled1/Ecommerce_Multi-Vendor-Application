import 'package:get/get.dart';
import 'package:pisti/data_layer/function_resbon.dart/profile_res.dart';
import 'package:pisti/domain_layer/models/cart_list_models.dart';

class CartController extends GetxController {
  CartListModels? cartListModels;

  getCartList(int idCato) async {
    try {
      var response = await getCartListRes(idCato);
      print('----------------------------------------');

      cartListModels = await CartListModels.fromJson(response[0]);
      return response;
    } catch (e) {
      print(' erorr catch $e');
      return 'error';
    }
  }
}
